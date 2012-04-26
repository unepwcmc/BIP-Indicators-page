namespace :bip do

  desc "Imports indicator data from spreadsheet"
  task :import_spreadsheet => [:environment] do
    require 'spreadsheet'
    Spreadsheet.client_encoding = 'UTF-8'
    book = Spreadsheet.open 'db/bip.xls'
    #import coding sheets
    coding_sheets = [
      {
        :klass => Goal,
        :sheet_idx => 1,
        :fields => [:code,:title],
        :field_indexes => [1,0]
      },
      {
        :klass => FocalArea,
        :sheet_idx => 3,
        :fields => [:code, :name, :question],
        :field_indexes => [0,1,2]
      },
      {
        :klass => Headline,
        :sheet_idx => 4,
        :fields => [:code, :title],
        :field_indexes => [1,2]
      },
      {
        :klass => Partner,
        :sheet_idx => 5,
        :fields => [:code, :name],
        :field_indexes => [1,2]
      },
      # {
        # :klass => OperationalIndicator,
        # :sheet_idx => 6,
        # :fields => [:code, :title],
        # :field_indexes => [0,1]
      # }
    ]
    coding_sheets.each do |sheet_meta|
      sheet = book.worksheet sheet_meta[:sheet_idx]
      sheet_meta[:klass].delete_all
      sheet.each 1 do |row|
        import_coding_row(row, sheet_meta)
      end
      puts sheet_meta[:klass].to_s
      puts sheet_meta[:klass].count
    end
    #import the targets sheet
    target_sheet = book.worksheet 2
    Target.delete_all
    target_sheet.each 1 do |row|
      import_target_row(row)
    end
    puts 'Target'
    puts Target.count
    #import the master sheet
    master_sheet = book.worksheet 0
    Indicator.delete_all
    master_sheet.each 2 do |row|
      import_master_row(row)
    end
    puts 'Indicator'
    puts Indicator.count
  end

  def import_coding_row(row, meta)
    code_idx = meta[:field_indexes][meta[:fields].index(:code)]
    return nil if row[code_idx].blank?
    obj = meta[:klass].new
    meta[:fields].each_with_index do |f, i|
      obj.send("#{f}=",row[meta[:field_indexes][i]])
    end
    obj.save
  end

  def import_target_row(row)
    return nil if row[3].blank?
    target = Target.new({
      :code => row[1],
      :title => row[0],
      :keyword => row[2]
    })
    target.goal = Goal.find_by_code(row[3])
    target.save
  end

  def import_master_row(row)
      indicator = Indicator.new({
        :rel_link => row[2],
        :title => row[1],
        :position => row[3]
      })
      #targets
      indicator.targets = Target.find_all_by_code(row[6].to_s.split(';'))
      #headlines
      indicator.headlines = Headline.find_all_by_code(row[8].to_s.split(';'))
      #focal areas
      indicator.focal_areas = FocalArea.find_all_by_code(row[11].to_s.split(';'))
      #partners
      indicator.partners = Partner.find_all_by_code(row[13].to_s.split(';'))
      indicator.save
  end

end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
goals = [
  {:code => 'A', :title => 'Strategic Goal A: Address the underlying causes of biodiversity loss'},
  {:code => 'B', :title => 'Strategic Goal B: Reduce the direct pressures on biodiversity and promote sustainable use'},
  {:code => 'C', :title => 'Strategic Goal C: Improve the status of biodiversity'},
  {:code => 'D', :title => 'Strategic Goal D: Enhance the benefits to all from biodiversity and ecosystem services'},
  {:code => 'E', :title => 'Strategic Goal E: Enhance implementation'}
]

targets = [
  {:index => 1, :title =>'Target 1 - People aware of the values of biodiversity and the steps they can take'},
  {:index => 2, :title =>'Target 2 - Biodiversity values integrated into development strategies and planning processes'},
  {:index => 3, :title =>'Target 3 - Harmful incentives phased out or reformed and positive incentives developed and applied'},
  {:index => 4, :title =>'Target 4 - Plans for sustainable production and consumption implemented'},
  {:index => 5, :title =>'Target 5 - The rate of loss of all natural habitats at least halved'},
  {:index => 6, :title =>'Target 6 - Overfishing avoided, fisheries managed sustainably with no significant adverse impacts'},
  {:index => 7, :title =>'Target 7 - Areas under agriculture, aquaculture and forestry managed sustainably'},
  {:index => 8, :title =>'Target 8 - Pollution brought to levels that are not detrimental to biodiversity'},
  {:index => 9, :title =>'Target 9 - Invasive alien species and pathways identified and controlled or eradicated'},
  {:index => 10, :title =>'Target 10 - The multiple anthropogenic pressures on vulnerable ecosystems minimized'},
  {:index => 11, :title =>'Target 11 - Terrestrial, inland water, and coastal and marine areas conserved through protected areas'},
  {:index => 12, :title =>'Target 12 - The extinction of known threatened species prevented'},
  {:index => 13, :title =>'Target 13 - Genetic diversity of cultivated plants and farmed and domesticated animals maintained'},
  {:index => 14, :title =>'Target 14 - Ecosystems that provide essential services, are restored and safeguarded'},
  {:index => 15, :title =>'Target 15 - Ecosystem resilience and carbon stocks enhanced through conservation and restoration'},
  {:index => 16, :title =>'Target 16 - The Nagoya Protocol is in force and operational'},
  {:index => 17, :title =>'Target 17 - National biodiversity strategy and action plans developed and implemented'},
  {:index => 18, :title =>'Target 18 - Traditional knowledge and customary use respected and reflected in CBD implementation'},
  {:index => 19, :title =>'Target 19 - Knowledge relating to biodiversity, improved, shared, transferred, and applied'},
  {:index => 20, :title =>'Target 20 - The mobilization of financial resources increased substantially'}
]

headlines = [
  {:title => 'Trends in extent of selected biomes, ecosystems, and habitats', :position =>1},
  {:title => 'Trends in abundance and distribution of selected species', :position =>2},
  {:title => 'Coverage of protected areas', :position =>3},
  {:title => 'Change in status of threatened species', :position =>4},
  {:title => 'Trends in Genetic Diversity', :position =>5},
  {:title => 'Areas under sustainable management', :position =>6},
  {:title => 'Proportion of products derived from sustainable sources', :position =>7},
  {:title => 'Ecological Footprint and related concepts', :position =>8},
  {:title => 'Nitrogen Deposition', :position =>9},
  {:title => 'Invasive Alien Species', :position =>10},
  {:title => 'Marine Trophic Index', :position =>11},
  {:title => 'Water Quality', :position =>12},
  {:title => 'Connectivity/fragmentation of ecosystems', :position =>13},
  {:title => 'Health and well being of communities', :position =>14},
  {:title => 'Biodiversity for food and medicine', :position =>15},
  {:title => 'Status and trends of linguistic diversity and numbers of speakers of indigenous languages', :position => 16},
  {:title => 'Official development assistance provided in support of the Convention', :position =>17}
]

indicators = [
  {:title => 'Extent of forests and forest types', :position => 1, :rel_link => 'forestextent'},
  {:title => 'Extent of assorted habitats', :position => 2, :rel_link => 'marinehabitats'},
  {:title => 'Living Planet Index', :position => 3, :rel_link => 'lpi'},
  {:title => 'Global Wild Bird Index', :position => 4, :rel_link => 'wbi'},
  {:title => 'Waterbird Indicator', :position => 5, :rel_link => ''},
  {:title => 'Coverage of Protected Areas', :position => 6, :rel_link => 'pacoverage'},
  {:title => 'Overlays with biodiversity', :position => 7, :rel_link => 'paoverlays'},
  {:title => 'Management effectiveness', :position => 8, :rel_link => 'pamanagement'},
  {:title => 'Red List Index and Sampled Red List Index', :position => 9, :rel_link => 'rli'},
  {:title => 'Ex situ crop collections', :position => 10, :rel_link => 'cropcollections'},
  {:title => 'Genetic diversity of terrestrial domesticated animals', :position => 11, :rel_link => 'domesticatedanimals'},
  {:title => 'Area of forest under sustainable management: certification', :position => 12, :rel_link => 'forestcertification'},
  {:title => 'Area of forest under sustainable management: degradation and deforestation', :position => 13, :rel_link => 'forestdegradation'},
  {:title => 'Area of agricultural ecosystems under sustainable management', :position => 14, :rel_link => 'sustainableagriculture'},
  {:title => 'Proportion of fish stocks in safe biological limits', :position => 15, :rel_link => ''},
  {:title => 'Status of species in trade', :position => 16, :rel_link => 'speciestrade'},
  {:title => 'Wild Commodities Index', :position => 17, :rel_link => 'wildcommoditiesindex'},
  {:title => 'Ecological Footprint and related concepts', :position => 18, :rel_link => 'ecologicalfootprint'},
  {:title => 'Nitrogen Deposition', :position => 19, :rel_link => 'nitrogendeposition'},
  {:title => 'Trends in Invasive Alien Species', :position => 20, :rel_link => 'invasivealienspecies'},
  {:title => 'Marine Trophic Index ', :position => 21, :rel_link => 'mti'},
  {:title => 'Water Quality Index for Biodiversity', :position => 22, :rel_link => 'wqib'},
  {:title => 'Forest Fragmentation', :position => 23, :rel_link => 'forestfragmentation'},
  {:title => 'River fragmentation and flow regulation', :position => 24, :rel_link => 'newindicatorspage/strategicgoalb/riverfragmentation'},
  {:title => 'Health and well being of communities directly dependant on ecosystem goods and services', :position => 25, :rel_link => 'healthofcommunities'},
  {:title => 'Nutritional status of biodiversity', :position => 26, :rel_link => 'nutritionindicators'},
  {:title => 'Biodiversity for food and medicine', :position => 27, :rel_link => 'foodandmedicine'},
  {:title => 'Status and trends of linguistic diversity and numbers of speakers of indigenous languages', :position => 28, :rel_link => 'linguisticdiversity'},
  {:title => 'Official development assistance provided in support of the Convention', :position => 29, :rel_link => 'oda'}
]

focal_areas = [
  {:name => 'A'},
  {:name => 'B'},
  {:name => 'C'},
  {:name => 'D'}
]

partners = [
  {:name => 'BirdLife International'},
  {:name => 'Convention on International Trade in Endangered Species'},
  {:name => 'Food and Agriculture Organization of the United Nations'},
  {:name => 'Global Footprint Network'},
  {:name => 'Global Invasive Species Programme'},
  {:name => 'International Nitrogen Initiative'},
  {:name => 'IUCN Sustainable Use Specialist Group'},
  {:name => 'Organisation for Economic Co-operation and Development'},
  {:name => 'Royal Society for the Protection of Birds'},
  {:name => 'The Nature Conservancy'},
  {:name => 'The University of Queensland'},
  {:name => 'TRAFFIC International'},
  {:name => 'United Nations Educational, Scientific and Cultural Organization'},
  {:name => 'United Nations Environment Programme World Conservation Monitoring Centre'},
  {:name => 'United Nations Environment Programme GEMS/Water Programme'},
  {:name => 'University of British Columbia Fisheries Centre'},
  {:name => 'WWF'},
  {:name => 'Zoological Society of London'}
]

#code => index
goals_targets = {
  'A' => [1,2,3,4],
  'B' => [5,6,7,8,9,10],
  'C' => [11,12,13],
  'D' => [14,15,16],
  'E' => [17,18,19,20]
}

#index => position
#TODO this mapping is completely made up for testing purposes
targets_indicators = {
  1 => [1,2,3],
  2 => [4,5],
  3 => [6,7,8],
  4 => [1,8,9],
  5 => [10,11],
  6 => [6,7],
  7 => [12,13,14],
  8 => [13],
  9 => [13,14,15,16,17,18,19,20],
  10 => [],
  11 => [],
  12 => [],
  13 => [],
  14 => [],
  15 => [],
  16 => [],
  17 => [],
  18 => [],
  19 => [],
  20 => []
}

#position => position
headlines_indicators = {
  1 => [1,2,3],
  2 => [4,5],
  3 => [6,7,8],
  4 => [9],
  5 => [10,11],
  6 => [12,13,14],
  7 => [15,16,17],
  8 => [18],
  9 => [19],
  10 => [20],
  11 => [21],
  12 => [22],
  13 => [23,24],
  14 => [25],
  15 => [26,27],
  16 => [28],
  17 => [29]
}

#ary index => position
partners_indicators = {
  0 => [4],
  1 => [16],
  2 => [1,2,10,11,13,14,26],
  3 => [18],
  4 => [20],
  5 => [19],
  6 => [17],
  7 => [29],
  8 => [4],
  9 => [24],
  10 => [8],
  11 => [27],
  12 => [28],
  13 => [2,6,7,8,12,16,17,23,25],
  14 => [22],
  15 => [21],
  16 => [3],
  17 => [3,9]
}

#ary index => position
focal_areas_indicators = {
  0 => [1],
  1 => [2],
  2 => [3],
  3 => [4]
}

indicators.each { |i| Indicator.create(i) }

partners.each_with_index do |p,i|
  partner = Partner.create(p)
  partner.indicators = Indicator.find(partners_indicators[i])
end

focal_areas.each_with_index do |f,i|
  focal_area = FocalArea.create(f)
  focal_area.indicators = Indicator.find(focal_areas_indicators[i])
end

headlines.each do |h|
  headline = Headline.create(h)
  headline.indicators = Indicator.find(headlines_indicators[headline.position])
end

targets.each do |t|
  target = Target.create(t)
  target.indicators = Indicator.find(targets_indicators[target.index])
end

goals.each do |g|
  goal = Goal.create(g)
  goal.targets = Target.find(goals_targets[goal.code])
end

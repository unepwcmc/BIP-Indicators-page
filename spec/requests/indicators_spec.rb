require 'spec_helper'

describe 'indicators' do
  describe 'GET /' do
    it 'works!' do
      visit '/'
      page.driver.response.status.should be(200)
    end

    it 'has the matrix tab selected by default' do
      visit '/'
      page.find('ul.nav li:first')['class'].should eq('active')
      page.find('#matrix')['class'].should eq('tab-pane active')
    end

    it 'changes #graphic tab to selected when clicking on the it', js: true do
      page.driver.browser.set_attribute(:local_storage_enabled, true)

      visit '/'
      click_link('Framework')
      page.find('ul.nav li + li')['class'].should eq('active')
      page.find('#graphic')['class'].should eq('tab-pane active')
    end

    it 'changes #headlines tab to selected when clicking on the it', js: true do
      page.driver.browser.set_attribute(:local_storage_enabled, true)

      visit '/'
      click_link('Proposed Headlines')
      page.find('ul.nav li:last')['class'].should eq('active')
      page.find('#headlines')['class'].should eq('tab-pane active')
    end

    it 'does not show any indicators by default on the matrix tab', js: true do
      page.driver.browser.set_attribute(:local_storage_enabled, true)

      FactoryGirl.create(:indicator, title: 'The most indicator of the world')

      visit '/'
      page.find('#indicators').should_not have_content('The most indicator of the world')
    end

    it 'does not show any indicators by default on the graphic tab', js: true do
      page.driver.browser.set_attribute(:local_storage_enabled, true)

      FactoryGirl.create(:indicator, title: 'The most indicator of the world')

      visit '/'
      click_link('Framework')
      page.find('#indicators').should_not have_content('The most indicator of the world')
    end

    it 'does not show any indicators by default on the headlines tab', js: true do
      page.driver.browser.set_attribute(:local_storage_enabled, true)

      FactoryGirl.create(:indicator, title: 'The most indicator of the world')

      visit '/'
      click_link('Proposed Headlines')
      page.find('#indicators').should_not have_content('The most indicator of the world')
    end

    describe 'goals list' do
      it 'shows goal`s code', js: true do
        page.driver.browser.set_attribute(:local_storage_enabled, true)

        FactoryGirl.create(:goal, code: 'ABBA')

        visit '/'
        page.find('#matrix').should have_content('ABBA')
      end

      describe 'targets list' do
        it 'shows target`s keyword', js: true do
          page.driver.browser.set_attribute(:local_storage_enabled, true)

          goal = FactoryGirl.create(:goal, code: 'ABBA')
          FactoryGirl.create(:target, keyword: 'ABC', goal: goal)

          visit '/'
          wait_until { page.find('#matrix').has_content?('ABBA') }
          page.find('#matrix').should have_content('ABC')
        end

        it 'shows indicators associated with the clicked target', js: true do
          page.driver.browser.set_attribute(:local_storage_enabled, true)

          goal = FactoryGirl.create(:goal, code: 'ABBA')

          target_1 = FactoryGirl.create(:target, keyword: 'ABC', goal: goal)
          target_2 = FactoryGirl.create(:target, keyword: 'XYZ', goal: goal)

          FactoryGirl.create(:indicator, title: 'This one should appear', targets: [target_1])
          FactoryGirl.create(:indicator, title: 'This one should also appear', targets: [target_1])
          FactoryGirl.create(:indicator, title: 'This one should not appear', targets: [target_2])

          visit '/'
          page.execute_script('$("div.keyword:contains(\'ABC\')").click()')
          page.find('#indicators-container').should have_content('This one should appear')
          page.find('#indicators-container').should have_content('This one should also appear')
          page.find('#indicators-container').should_not have_content('This one should not appear')
        end
      end
    end

    describe 'graph' do
      it 'shows indicators associated with the clicked focal_area', js: true, :driver => :selenium do
        focal_area_1 = FactoryGirl.create(:focal_area, name: 'A')
        focal_area_2 = FactoryGirl.create(:focal_area, name: 'B')

        FactoryGirl.create(:indicator, title: 'This one should appear', focal_areas: [focal_area_1])
        FactoryGirl.create(:indicator, title: 'This one should also appear', focal_areas: [focal_area_1])
        FactoryGirl.create(:indicator, title: 'This one should not appear', focal_areas: [focal_area_2])

        visit '/'
        click_link('Framework')
        # Workaround to test clicking on the image map
        page.execute_script('window.router.filterByFocalArea("A");return false')
        page.find('#indicators-container').should have_content('This one should appear')
        page.find('#indicators-container').should have_content('This one should also appear')
        page.find('#indicators-container').should_not have_content('This one should not appear')
      end
    end

    describe 'headlines list' do
      it 'shows indicators associated with the clicked headline', js: true do
        page.driver.browser.set_attribute(:local_storage_enabled, true)

        headline_1 = FactoryGirl.create(:headline, title: 'The first headline ever')
        headline_2 = FactoryGirl.create(:headline, title: 'The last headline ever')

        FactoryGirl.create(:indicator, title: 'This one should appear', headlines: [headline_1])
        FactoryGirl.create(:indicator, title: 'This one should also appear', headlines: [headline_1])
        FactoryGirl.create(:indicator, title: 'This one should not appear', headlines: [headline_2])

        visit '/'
        click_link('Proposed Headlines')
        page.execute_script('$(".title:contains(\'The first headline ever\')").click()')
        page.find('#indicators-container').should have_content('This one should appear')
        page.find('#indicators-container').should have_content('This one should also appear')
        page.find('#indicators-container').should_not have_content('This one should not appear')
      end
    end

    describe 'filters' do
      describe 'partners select' do
        it 'shows indicators associated with the selected target and partner', js: true do
          page.driver.browser.set_attribute(:local_storage_enabled, true)

          goal = FactoryGirl.create(:goal, code: 'ABBA')

          target_1 = FactoryGirl.create(:target, keyword: 'ABC', goal: goal)
          target_2 = FactoryGirl.create(:target, keyword: 'XYZ', goal: goal)

          partner_1 = FactoryGirl.create(:partner, name: 'Batman')
          partner_2 = FactoryGirl.create(:partner, name: 'Robin')

          FactoryGirl.create(:indicator, title: 'This one should appear', targets: [target_1], partners: [partner_1])
          FactoryGirl.create(:indicator, title: 'This one should not appear', targets: [target_1], partners: [partner_2])
          FactoryGirl.create(:indicator, title: 'This last one should not appear either', targets: [target_2], partners: [partner_1, partner_2])

          visit '/'
          page.execute_script('$("div.keyword:contains(\'ABC\')").click()')
          select('Batman', from: 'partner')
          page.find('#indicators-container').should have_content('This one should appear')
          page.find('#indicators-container').should_not have_content('This one should not appear')
          page.find('#indicators-container').should_not have_content('This last one should not appear either')
        end

        it 'shows indicators associated with the selected focal_area and partner', js: true, :driver => :selenium do
          focal_area_1 = FactoryGirl.create(:focal_area, name: 'A')
          focal_area_2 = FactoryGirl.create(:focal_area, name: 'B')

          partner_1 = FactoryGirl.create(:partner, name: 'Batman')
          partner_2 = FactoryGirl.create(:partner, name: 'Robin')

          FactoryGirl.create(:indicator, title: 'This one should appear', focal_areas: [focal_area_1], partners: [partner_1])
          FactoryGirl.create(:indicator, title: 'This one should not appear', focal_areas: [focal_area_1], partners: [partner_2])
          FactoryGirl.create(:indicator, title: 'This last one should not appear either', focal_areas: [focal_area_2], partners: [partner_1, partner_2])

          visit '/'
          click_link('Framework')
          # Workaround to test clicking on the image map
          page.execute_script('window.router.filterByFocalArea("A");return false')
          select('Batman', from: 'partner')
          page.find('#indicators-container').should have_content('This one should appear')
          page.find('#indicators-container').should_not have_content('This one should not appear')
          page.find('#indicators-container').should_not have_content('This last one should not appear either')
        end

        it 'shows indicators associated with the selected headline and partner', js: true, :driver => :selenium do
          headline_1 = FactoryGirl.create(:headline, title: 'The first headline ever')
          headline_2 = FactoryGirl.create(:headline, title: 'The last headline ever')

          partner_1 = FactoryGirl.create(:partner, name: 'Batman')
          partner_2 = FactoryGirl.create(:partner, name: 'Robin')

          FactoryGirl.create(:indicator, title: 'This one should appear', headlines: [headline_1], partners: [partner_1])
          FactoryGirl.create(:indicator, title: 'This one should not appear', headlines: [headline_1], partners: [partner_2])
          FactoryGirl.create(:indicator, title: 'This last one should not appear either', headlines: [headline_2], partners: [partner_1, partner_2])

          visit '/'
          click_link('Proposed Headlines')
          page.execute_script('$(".title:contains(\'The first headline ever\')").click()')
          select('Batman', from: 'partner')
          page.find('#indicators-container').should have_content('This one should appear')
          page.find('#indicators-container').should_not have_content('This one should not appear')
          page.find('#indicators-container').should_not have_content('This last one should not appear either')
        end
      end
    end
  end
end

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
      visit '/'
      click_link('Graphic')
      page.find('ul.nav li + li')['class'].should eq('active')
      page.find('#graphic')['class'].should eq('tab-pane active')
    end

    it 'changes #headlines tab to selected when clicking on the it', js: true do
      visit '/'
      click_link('Headlines')
      page.find('ul.nav li:last')['class'].should eq('active')
      page.find('#headlines')['class'].should eq('tab-pane active')
    end

    it 'does not show any indicators by default on the matrix tab', js: true do
      FactoryGirl.create(:indicator, title: 'The most indicator of the world')

      visit '/'
      page.find('#indicators').should_not have_content('The most indicator of the world')
    end

    it 'does not show any indicators by default on the graphic tab', js: true do
      FactoryGirl.create(:indicator, title: 'The most indicator of the world')

      visit '/'
      click_link('Graphic')
      page.find('#indicators').should_not have_content('The most indicator of the world')
    end

    it 'does not show any indicators by default on the headlines tab', js: true do
      FactoryGirl.create(:indicator, title: 'The most indicator of the world')

      visit '/'
      click_link('Headlines')
      page.find('#indicators').should_not have_content('The most indicator of the world')
    end

    describe 'goals list' do
      it 'shows goal`s code', js: true do
        FactoryGirl.create(:goal, code: 'ABBA')

        visit '/'
        page.find('#matrix').should have_content('ABBA')
      end

      describe 'targets list' do
        it 'shows target`s keyword', js: true do
          goal = FactoryGirl.create(:goal, code: 'ABBA')
          FactoryGirl.create(:target, keyword: 'ABC', goal: goal)

          visit '/'
          page.find('#matrix').should have_content('ABC')
        end
      end
    end

    describe 'graph' do
    end

    describe 'headlines list' do
    end

    describe 'indicators list' do
    end
  end
end

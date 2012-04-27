class IndicatorsController < ApplicationController
  caches_page :index
  cache_sweeper :indicator_sweeper

  def index
    @indicators = Indicator.all
    @goals = Goal.all
    @targets = Target.all
    @headlines = Headline.all
    @focal_areas = [
      FocalArea.find_by_name('Pressures'),
      FocalArea.find_by_name('State'),
      FocalArea.find_by_name('Benefits'),
      FocalArea.find_by_name('Responses')
    ]
    @partners = Partner.all
  end
end

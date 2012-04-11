class IndicatorsController < ApplicationController
  caches_page :index

  def index
    @indicators = Indicator.all
    @goals = Goal.all
    @targets = Target.all
    @headlines = Headline.all
    @focal_areas = FocalArea.all
    @partners = Partner.all
  end
end

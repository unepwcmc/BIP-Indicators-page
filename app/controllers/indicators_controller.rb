class IndicatorsController < ApplicationController
  #caches_page :index

  def index
    @indicators = Indicator.all
    @goals = Goal.all
    @targets = Target.all
    @headlines = Headline.all
    @focal_areas = FocalArea.all
    @partners = Partner.all

    @timestamp = [
      Indicator.maximum(:updated_at),
      Goal.maximum(:updated_at),
      Target.maximum(:updated_at),
      Headline.maximum(:updated_at),
      FocalArea.maximum(:updated_at),
      Partner.maximum(:updated_at)
    ].max
  end
end

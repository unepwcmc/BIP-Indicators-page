class IndicatorsController < ApplicationController
  def index
    @indicators = Indicator.all
    @goals = Goal.all
    @targets = Target.all
    @headlines = Headline.all
    @partners = Partner.all
  end
end

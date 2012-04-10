class IndicatorsController < ApplicationController
  def index
    @indicators = Indicator.all
  end
end

class IndicatorSweeper < ActionController::Caching::Sweeper
  observe Indicator, Goal, Target, Headline, FocalArea, Partner

  def after_create(model)
    expire_cache
  end

  def after_update(model)
    expire_cache
  end

  def after_destroy(model)
    expire_cache
  end

  private
    def expire_cache
      expire_page(:controller => 'indicators', :action => 'index')
    end
end

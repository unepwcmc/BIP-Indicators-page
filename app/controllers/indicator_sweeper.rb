class IndicatorSweeper < ActionController::Caching::Sweeper
  observe Indicator

  def after_create(indicator)
    expire_cache_for(indicator)
  end

  def after_update(indicator)
    expire_cache_for(indicator)
  end

  def after_destroy(indicator)
    expire_cache_for(indicator)
  end

  private
  def expire_cache_for(indicator)
    # Expire the index page now that we added a new indicator
    expire_page(:controller => 'indicators', :action => 'index')
 
    # Expire a fragment
    #expire_fragment('all_available_indicators')
  end
end
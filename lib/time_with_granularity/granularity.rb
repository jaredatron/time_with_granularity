class TimeWithGranularity
  # Adding granularity to Time allows you to express how accurate the time is. This is done by storing the level of accurace
  # in the form of granularity in seconds (or milliseconds) and then supplying a set of helper methods to help identify
  # and use this range of time
  #
  #           |-------|-------|
  #    eldest_time    |   youngest_time
  #                 time        
  #                       
  module Granularity

    # Returns the level of granularity this time has
    def granularity=(new_granularity)
      @granularity = new_granularity;
    end

    # Allows you to set the level of granularity this time has
    def granularity
      @granularity
    end
    alias_method :accuracy, :granularity
    
    # Returns the oldest 
    def eldest_time
      self - half_granularity
    end
    
    def youngest_time
      self + half_granularity
    end
    
    # Returns a range ranging from the eldest_time
    def range
      eldest_time .. youngest_time
    end
    
    def range=(new_range)
      new_range = new_range.to_a
      granularity = new_range[1] - new_range[0]
    end
    
    private 
    
    def half_granularity
      # ((self + granularity) - self) / 2  <- has time zone issues
      granularity / 2
    end
    
  end
end

Time.send :include, TimeWithGranularity::Granularity
Date.send :include, TimeWithGranularity::Granularity
DateTime.send :include, TimeWithGranularity::Granularity
# ~> -:53: uninitialized constant Date (NameError)

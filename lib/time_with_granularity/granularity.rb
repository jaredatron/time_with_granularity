class TimeWithGranularity
  module Granularity

    def granularity=(new_granularity)
      @granularity = new_granularity;
    end

    def granularity
      @granularity
    end
    
    def eldest_time
      self - half_granularity
    end
    
    def youngest_time
      self + half_granularity
    end
    
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
require 'active_support'
require File.join( File.dirname(__FILE__), 'hash' )
require File.join( File.dirname(__FILE__), 'time_with_granularity/granularity' )

class TimeWithGranularity
  VERSION = '0.0.1'
  
  class << self
    
    # Parses datetime strings much like Time.parse but adds support for 
    # loan years like '1998'
    # and loan months like 'August 1796'
    # as well as assigns the Time#granularity with the time's apropriate level of granularity
    # based on how specific the time string given is
    def parse(string)
      parts = _parse(string)
      # {:mday=>5, :mon=>5, :zone=>"-0700", :sec=>0, :offset=>-25200, :year=>2009, :hour=>19, :min=>26, :wday=>2}

      granularity = begin
           if parts.has_keys? :sec
          1.second                               
        elsif parts.has_keys? :min
          1.minute
        elsif parts.has_keys? :hour
          1.hour
        elsif parts.has_keys? :mday
          1.day
        elsif parts.has_keys? :year, :mon
          string = "#{parts[:mon]}/1/#{parts[:year]}"
          1.month
        elsif parts.has_keys? :year
          string = "1/1/#{parts[:year]}"
          1.year
        else
          0
        end
      end

      time = ::Time.zone.parse( string )
      time.granularity = granularity
      time
    end
  
    # Wraps Date._parse adding support for loan years like '2002'
    def _parse(string)
      if string.match(/^\d+$/)
        {:year=>string}
      else
        ::Date._parse(string)
      end
    end
    
  end
  
end

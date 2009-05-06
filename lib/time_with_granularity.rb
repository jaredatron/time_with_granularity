require 'active_support'
require File.join( File.dirname(__FILE__), 'hash' )
require File.join( File.dirname(__FILE__), 'time_with_granularity/granularity' )

class TimeWithGranularity
  VERSION = '0.0.1'
  
  def self.parse(string)
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
    
    # begin
      time = ::Time.zone.parse( string )
    # rescue ArgumentError => e
    #   puts "#{string} is invalid"
    #   raise e
    # end
    #       
    # puts <<-DEBUG
    # 
    # string: #{string}
    # parts: #{parts.inspect}
    # granularity: #{granularity} #{granularity.inspect}
    # time: #{time}
    # 
    # DEBUG
    
    time.granularity = granularity
    time
  end
  
  def self._parse(string)
    if string.match(/^\d+$/)
      {:year=>string}
    else
      ::Date._parse(string)
    end
  end
  
  def self.now
    ::Date._parse Time.now.to_s
  end
  
end

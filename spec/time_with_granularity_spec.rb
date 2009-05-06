require File.join(File.dirname(__FILE__), 'spec_helper')

describe TimeWithGranularity do

  before do
    @examples = {
      :year   => [
        '2001', '1982', '1200'
      ],
      :month  => [
        'July 1772', 'May 1960'
      ],
      :day    => [
        'August 23rd 1982', 'September 11th, 2001'
      ],
      :hour   => [
        '1am', '6pm', '11th 9am', 'March 3rd 12pm 1437'
      ],
      :minute => [
        '2:30am', '1:01pm', 'March 3rd 12:00pm 1437'
      ],
      :second => [
        '2:30:01am', '1:01:59pm', 'March 3rd 12:10:23pm 1437'
      ],
    }
  end

  it "should set granulartiy to 1 day when given a year string" do
    @examples[:year].each do |year|
      time = TimeWithGranularity.parse( year )
      time.granularity.should == 1.year
    end
  end

  it "should set granulartiy to 1 month when given a month" do
    @examples[:month].each do |month|
      time = TimeWithGranularity.parse( month )
      time.granularity.should == 1.month
    end
  end

  it "should set granulartiy to 1 day when given August 23rd 1982" do
    @examples[:day].each do |day|
      time = TimeWithGranularity.parse( day )
      time.granularity.should == 1.day
    end
  end
  
  it "should set granulartiy to 1 hour when given an hour" do
    @examples[:hour].each do |hour|
      time = TimeWithGranularity.parse( hour )
      time.granularity.should == 1.hour
    end
  end
  
  it "should set granulartiy to 1 minute when given a minute" do
    @examples[:minute].each do |minute|
      time = TimeWithGranularity.parse( minute )
      time.granularity.should == 1.minute
    end
  end
  
  it "should set granulartiy to 1 second when given a second" do
    @examples[:second].each do |second|
      time = TimeWithGranularity.parse( second )
      time.granularity.should == 1.second
    end
  end
  
  describe "zone" do
    it "should maintain Time#zone throught conversion" do
      # time
      @examples.each_pair do |granularity, times|
        times.each do |time_string|
          time = TimeWithGranularity.parse( time_string )
          time.granularity.should == 1.send(granularity)
        end
      end
    end
  end
  
  it "shouldn't barf on a wide range of time strings" do
    
  end

end
require './lib/docking_station'

class Van
    attr_reader :broken_bikes

  def initialize(broken_bikes = [])
    @broken_bikes = broken_bikes
  end

  def broken_bikes
    @@bikes.each do |bike|
      if  bike.broken? == true
        @broken_bikes << bike
      end
      end
    end

    def deliver
        @broken_bikes
    end
end
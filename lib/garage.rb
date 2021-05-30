require 'van'

class Garage
    attr_reader :broken_bikes

    def initialize
      @broken_bikes
    end
  
    def fix
        @broken_bikes.map do |bike|
            bike.working? == true
            @bikes << bike
        end
    end

    def fixed_bikes
        @bikes = []
    end

end

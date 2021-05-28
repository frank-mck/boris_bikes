class DockingStation
    attr_reader :bikes

    def initialize
      @bikes = []
    end

    def dock(bike)
      raise 'Docking station full' if @bikes.length > 0
      @bikes.push(bike)
    end

  def release_bike
    raise 'No bikes available' unless @bikes.length > 0
    @bikes.pop
  end

end 
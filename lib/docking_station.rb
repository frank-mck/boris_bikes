class DockingStation
    attr_reader :bikes

    def initialize
      @bikes = []
    end

    def dock(bike)
        fail 'Docking station full' if full?
        @bikes << bike
    end

  def release_bike
    raise 'No bikes available' if @bikes.empty?
    @bikes.pop
  end

  private

  def full?
    @bikes.count >= 20
  end

  def empty?
    @bikes.empty?
  end
end 
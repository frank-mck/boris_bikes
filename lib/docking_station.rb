class DockingStation
    attr_reader :bikes
    DEFAULT_CAPACITY = 20

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
    @bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end
end 
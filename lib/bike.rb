class Bike
  attr_reader :broken

  def broken?
    @broken
  end

  def working?
    false
  end

  def report_broken
    @broken = true
  end
end
struct Time
  def self.new
    return previous_def unless Timecop.active?
    Timecop.now
  end

  def self.now
    new
  end
end

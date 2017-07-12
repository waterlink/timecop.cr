# To get .new defined by compiler, so that it is possible to use
# `#previous_def`
typeof(Time.new)

struct Time
  def self.new
    return previous_def unless Timecop.active?
    Timecop.now
  end

  def self.now
    new
  end

  def self.utc_now
    new.to_utc
  end
end

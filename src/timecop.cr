require "./timecop/*"

module Timecop
  extend self

  @@frozen = Time.now

  def now
    @@frozen || Time.now
  end

  def freeze(at)
    @@frozen = at
  end

  def freeze(at, &blk)
    @@frozen = at
    yield
    reset
  end

  def reset
    @@frozen = nil
  end

  def active?
    @@frozen && true
  end
end

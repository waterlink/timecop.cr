require "./timecop/*"

module Timecop
  extend self

  def now
    if @@frozen
      @@frozen.not_nil!
    else
      Time.new
    end
  end

  def freeze(at)
    @@frozen = at
  end

  def freeze(at, &blk)
    @@frozen = at
    blk.call
    reset
  end

  def reset
    @@frozen = nil
  end
end

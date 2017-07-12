require "spec"
require "../src/timecop"

def with_supported_time_now
  yield("Time.now", -> { Time.now })
  yield("Time.new", -> { Time.new })
  yield("Time.utc_now", -> { Time.utc_now })
end

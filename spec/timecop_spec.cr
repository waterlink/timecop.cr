require "./spec_helper"

describe Timecop do
  with_supported_time_now do |time_now_repr, time_now|
    context "when `#{time_now_repr}` used" do
      describe ".freeze" do
        it "freezes time" do
          now = time_now.call
          Timecop.freeze(now)

          past = 2.days.ago
          Timecop.freeze(past)
          time_now.call.should eq(past)
          sleep(0.001)
          time_now.call.should eq(past)

          future = 4.days.from_now
          future.should eq(now + 2.days)
          Timecop.freeze(future)
          time_now.call.should eq(future)

          Timecop.reset
        end

        it "works in block form" do
          now = time_now.call
          past = 2.days.ago
          block_called = false

          Timecop.freeze(past) do
            time_now.call.should eq(past)
            block_called = true
          end

          block_called.should eq(true)
          (time_now.call >= now).should eq(true)
        end
      end

      describe ".reset" do
        it "restores normal time flow" do
          now = time_now.call
          Timecop.freeze(2.days.ago)
          Timecop.reset

          (time_now.call >= now).should eq(true)
          sleep(0.001)
          (time_now.call >= now + 0.001.seconds).should eq(true)
        end
      end
    end
  end
end

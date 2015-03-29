require "./spec_helper"

describe Timecop do
  describe ".freeze" do
    it "changes `Time.now`" do
      now = Time.now
      Timecop.freeze(now)

      past = 2.days.ago
      Timecop.freeze(past)
      Time.now.should eq(past)
      sleep(0.001)
      Time.now.should eq(past)

      future = 4.days.from_now
      future.should eq(now + 2.days)
      Timecop.freeze(future)
      Time.now.should eq(future)

      Timecop.reset
    end

    it "works in block form" do
      now = Time.now
      past = 2.days.ago
      block_called = false

      Timecop.freeze(past) do
        Time.now.should eq(past)
        block_called = true
      end

      block_called.should eq(true)
      (Time.now >= now).should eq(true)
    end
  end

  describe ".reset" do
    it "restores normal time flow" do
      now = Time.now
      Timecop.freeze(2.days.ago)
      Timecop.reset

      (Time.now >= now).should eq(true)
      sleep(0.001)
      (Time.now >= now + 0.001.seconds).should eq(true)
    end
  end
end

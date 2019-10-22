require 'test_helper'

class ExampleJobTest < ActiveJob::TestCase
  test "test sidekiq" do
    assert_equal 0, HardWorker.jobs.size
    HardWorker.perform_async(1, 2)
    assert_equal 1, HardWorker.jobs.size
  end
end

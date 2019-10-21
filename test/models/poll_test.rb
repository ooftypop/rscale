require 'test_helper'

class PollTest < ActiveSupport::TestCase

  test "setup" do
    @poll = polls(:valid_poll)
    assert @poll.valid?
  end

  test "create a poll with poll options" do
    # assert
  end

  test "should not save poll without title" do
    poll = Poll.new(description: "Poll test description")
    refute poll.valid?, 'Poll is valid without title'
    assert_not poll.save, "Saved the poll without a title"
    assert_not_nil poll.errors[:title], 'no validation error for title present'
  end
end

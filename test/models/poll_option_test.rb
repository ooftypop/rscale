require 'test_helper'

class PollOptionTest < ActiveSupport::TestCase

  # test "setup" do
  #   @poll_option = poll_options(:valid_poll_option)
  #   assert @poll_option.valid?
  # end

  test "should not save poll option without title" do
    poll_option = PollOption.new(description: "Poll option test description")
    refute poll_option.valid?, 'Poll option is valid without title'
    assert_not poll_option.save, "Saved the poll option without a title"
    assert_not_nil poll_option.errors[:title], 'no validation error for title present'
  end
end

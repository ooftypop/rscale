require 'test_helper'

class ParticipantsControllerTest < ActionController::TestCase

  test 'create poll email is enqueued to be delivered later' do
    assert_enqueued_jobs 1 do
      post :create_poll_roles, {…}
    end
  end

  test 'app group email is enqueued to be delivered later' do
    assert_enqueued_jobs 1 do
      post :add_poll_groups, {…}
    end
  end
end

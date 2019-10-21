require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "sign up user" do
    visit new_user_registration_path

    fill_in "Email",                 with: "Test@test.com"
    fill_in "Password",              with: "password"
    fill_in "Password Confirmation", with: "password"

    click_on "Sign up"
  end
end

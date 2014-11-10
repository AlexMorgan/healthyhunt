require 'rails_helper'

feature "user signs up", %q{
  As a User
  I want to register an account
  So that I can have full interaction priveleges
} do

  # Acceptance Criteria

  # - I must provide my email, a password, and a password confirmation
  # - I see an error message if I do not provide all required information

  scenario "User signs up with valid information" do
    visit new_user_registration_path

    fill_in "Email", with: "user@gmail.com"
    fill_in "Username", with: "username09"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Sign up"

    expect(page).to have_content "Welcome! You have signed up successfully"
  end

  scenario "User signs up without valid information" do
    visit new_user_registration_path

    click_on "Sign up"

    expect(page).to have_content "Email can't be blank"
    expect(page).to have_content "Password can't be blank"
    expect(page).to have_content "Username can't be blank"
  end

  scenario "User signs in with their username and password" do
    user = FactoryGirl.create(:user)

    visit new_user_registration_path
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Sign in'

    expect(page).to have_content "Signed in successfully."
  end
end

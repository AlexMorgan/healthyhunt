require 'rails_helper'

feature "user changes their username without entering their password", %q{
  As a User
  I want to be able to change my password without entering my password
  So that I can change my username on the fly
} do

  scenario "Users enters in their username that isn't taken" do
    user = FactoryGirl.create(:user)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Sign in'

    visit edit_user_registration_path
    fill_in 'Username', with: 'newusername'
    click_on 'Update'

    expect(page).to have_content 'You updated your account successfully.'
  end

end

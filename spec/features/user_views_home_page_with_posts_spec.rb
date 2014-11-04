require 'spec_helper'

feature "User visits the home page" do
  # As a User
  # I want to see all the posts on one page
  # So that I know what healthy things to eat
  #
  # Acceptance Criteria:
  #
  # * I see a title of the healthy thing to eat and a small description
  # * I see all of the posts listed from the week

  it "displays a healthy eat" do
    visit '/'
    expect(page).to have_content "All The Events"
  end
end

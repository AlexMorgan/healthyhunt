require 'rails_helper'

feature "User upvotes an existing post", %q{
  As a User
  I want to be able to upvote any post of the website
  So that I can attract other users to good products
} do

  scenario "User Upvotes a post while signed in" do
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post)
    log_in(user)

    visit root_path

    find(".vote-up").click

    expect(page).to have_content "You have upvoted!"

  end

  scenario "User tries to upvote a post while not signed in" do
    post = FactoryGirl.create(:post)

    visit root_path
    find(".vote-up").click
    expect(page).to have_content "Please sign in"
  end

  scenario "User upvotes a post and then decides to revoke their vote" do
    post = FactoryGirl.create(:post)
    user = FactoryGirl.create(:user)
    log_in(user)

    visit root_path
    find(".vote-up").click
    find(".vote-down").click
    expect(page).to have_content "All evidence of your upvote has been destroyed!"
  end

end

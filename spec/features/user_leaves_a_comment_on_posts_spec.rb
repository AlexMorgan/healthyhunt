require 'rails_helper'

feature "User comments on a pose", %q{
  As a User
  I want to be able to leave a comment on a post
  So that I can voice my opinion or concern
} do

  scenario "User successfully leaves a comment" do
    post = FactoryGirl.create(:post)
    user = FactoryGirl.create(:user)
    log_in(user)

    visit post_path(post)
    expect(page).to have_content "Leave Comment"

    fill_in 'comment_body', with: 'This is a test'
    click_on "Comment"

    expect(page).to have_content "Your comment has been submitted"
  end

  scenario "User tries to leave a comment without input" do
    post = FactoryGirl.create(:post)
    user = FactoryGirl.create(:user)
    log_in(user)

    visit post_path(post)
    expect(page).to have_content "Leave Comment"

    click_on "Comment"
    expect(page).to have_content "Please make sure your submission is complete"
  end

  scenario "User deletes a comment" do
    post = FactoryGirl.create(:post)
    user = FactoryGirl.create(:user)
    log_in(user)

    visit root_path

    visit post_path(post)
    expect(page).to have_content "Leave Comment"

    fill_in 'comment_body', with: 'This is a test'
    click_on "Comment"
    expect(page).to have_content "Your comment has been submitted"

    click_on "Delete"
    expect(page).to have_content "Your comment has been deleted"
  end

end

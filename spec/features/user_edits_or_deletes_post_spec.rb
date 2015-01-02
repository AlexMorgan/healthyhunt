require 'rails_helper'

feature "User edits or deletes a post", %q{
  As a User
  I want to be able to edit or delete my posts
  So that I can fix mistakes or get rid of bad posts
} do

  scenario "User edits a post" do
    post = FactoryGirl.build(:post)
    user = FactoryGirl.create(:user)
    log_in(user)

    visit new_post_path
    fill_in 'Product Name', with: post.product_name
    fill_in 'Product URL', with: post.url
    fill_in 'Tagline', with: post.tagline
    click_on 'Hunt!'

    visit profile_path
    click_on 'Edit'
    fill_in('Product Name', with: 'Aleve')
    click_on 'Hunt!'
    expect(page).to have_content "Your post have been successfully updated"
  end


  scenario "User edits a post" do
    post = FactoryGirl.build(:post)
    user = FactoryGirl.create(:user)
    log_in(user)

    visit new_post_path
    fill_in 'Product Name', with: post.product_name
    fill_in 'Product URL', with: post.url
    fill_in 'Tagline', with: post.tagline
    click_on 'Hunt!'

    visit profile_path
    click_on 'Delete'
    expect(page).to have_content "#{post.product_name} has been deleted"
  end
end

require 'rails_helper'

feature "User creates a new health post", %q{
  As a User
  I want to be able to add new posts of restaurants
  So that my peers can view healthy eating alternatives
} do

  scenario "User creates a post with valid/required input" do
    post = FactoryGirl.build(:post)
    user = FactoryGirl.create(:user)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Sign in'

    visit new_post_path
    fill_in 'Product Name', with: post.product_name
    fill_in 'Product URL', with: post.url
    fill_in 'Tagline', with: post.tagline
    click_on 'Add Post'

    expect(page).to have_content "Your post has been successfully added."
  end

  scenario "User creates a post with incomplete input" do
    post = FactoryGirl.build(:post)
    user = FactoryGirl.create(:user)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Sign in'

    visit new_post_path
    fill_in 'Product Name', with: post.product_name
    click_on 'Add Post'

    expect(page).to have_content "Url is not a valid URL"
    expect(page).to have_content "Tagline can't be blank"
  end

  scenario "User enters an invalid URL for a new post" do
    post = FactoryGirl.build(:post)
    user = FactoryGirl.create(:user)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Sign in'

    visit new_post_path
    fill_in 'Product Name', with: post.product_name
    fill_in 'Product URL', with: 'someinvalidurl'
    fill_in 'Tagline', with: post.tagline
    click_on 'Add Post'

    expect(page).to have_content "Url is not a valid URL"
  end

end


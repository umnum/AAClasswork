# spec/features/auth_spec.rb

require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  background :each do
      visit new_user_path
  end

  scenario 'has a new user page' do
    expect(page).to have_content("SIGN UP")
  end

  feature 'signing up a user' do
    background :each do
      visit '/sessions/new'
    end
    scenario 'shows username on the homepage after signup' do
      fill_in "Username", with: "cappy2"
      fill_in "Password", with: "password"
      click_button "Sign In"
      expect(page).to have_content ("cappy2")
      user = User.find_by(username: "cappy2")
      expect(current_path).to eq(user_path(user))
    end
  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login'

end

feature 'logging out' do
  scenario 'begins with a logged out state'

  scenario 'doesn\'t show username on the homepage after logout'

end
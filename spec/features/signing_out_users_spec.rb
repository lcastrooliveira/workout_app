require 'rails_helper'

RSpec.feature 'sign out users' do
  before do
    @user = User.create!(first_name: 'owner', last_name: 'doe', email: 'user@example.com', password: 'password', password_confirmation: 'password')
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
  end
  scenario 'sign out user' do
    visit '/'
    click_link 'Sign out'
    expect(page).to have_content('Signed out successfully.')
  end
end

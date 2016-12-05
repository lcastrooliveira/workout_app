require 'rails_helper'

RSpec.feature 'sign in users' do
  before do
    @user = User.create!(first_name: 'owner', last_name: 'doe', email: 'user@example.com', password: 'password', password_confirmation: 'password')
  end
  scenario 'sign in user' do
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'

    expect(page).to have_content('Signed in successfully.')
    expect(page).to have_content("Signed in as #{@user.email}")
  end
end

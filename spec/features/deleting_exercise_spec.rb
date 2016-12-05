require 'rails_helper'

RSpec.feature 'deleting exercise' do
  before do
    @owner = User.create(first_name: 'owner', last_name: 'doe', email: 'owner@example.com', password: 'password')
    @owner_exer = @owner.exercises.create!(duration_in_min: 48, workout: 'cadardio special', workout_date: Date.today)
    login_as(@owner)
  end

  scenario do
    visit '/'
    click_link 'My Lounge'
    link = "//a[contains(@href, '/users/#{@owner.id}/exercises/#{@owner_exer.id}') and .//text()='Destroy']"
    find(:xpath, link).click
    expect(page).to have_content('Exercise has been deleted')
  end
end

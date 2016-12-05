require 'rails_helper'

RSpec.feature 'Listing Exercises' do
  before do
    @sarah = User.create!(first_name: 'sarah', last_name: 'ed', email: 'sarah@example.com', password: 'password', password_confirmation: 'password')
    @john = User.create!(first_name: 'john', last_name: 'doe', email: 'user@example.com', password: 'password', password_confirmation: 'password')
    login_as(@john)

    @e1 = @john.exercises.create(duration_in_min: 20, workout: 'Body building routine', workout_date: Date.today)
    @e2 = @john.exercises.create(duration_in_min: 20, workout: 'Body cardio', workout_date: Date.today)

    @following = Friendship.create(user: @john, friend: @sarah)
  end

  scenario 'show user\'s workout for last 7 days' do
    visit '/'
    click_link 'My Lounge'
    expect(page).to have_content(@e1.duration_in_min)
    expect(page).to have_content(@e1.workout)
    expect(page).to have_content(@e1.workout_date)

    expect(page).to have_content(@e2.duration_in_min)
    expect(page).to have_content(@e2.workout)
    expect(page).to have_content(@e2.workout_date)
  end

  scenario 'shows a list of users friends' do
    visit '/'
    click_link 'My Lounge'
    expect(page).to have_content('My Friends')
    expect(page).to have_link(@sarah.full_name)
    expect(page).to have_link('Unfollow')
  end
end

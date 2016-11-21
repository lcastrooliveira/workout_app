require 'rails_helper'

RSpec.feature 'Creating Home Page' do
  scenario 'should find the Workout lounge content' do
    visit '/'

    expect(page).to have_link('Athletes Den')
    expect(page).to have_link('Home')
    expect(page).to have_link('Workout Lounge')
  end
end

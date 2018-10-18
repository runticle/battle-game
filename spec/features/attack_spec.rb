require 'capybara'
require 'capybara/rspec'

feature 'attacking players' do
  scenario 'i can attack player 2' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content 'John attacked Not John!'
  end
  scenario 'reduce p2s hitpoints from 100 to 90HP' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content 'Not John 90HP'
  end
end

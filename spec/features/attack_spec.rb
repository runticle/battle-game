require 'capybara'
require 'capybara/rspec'

feature 'attacking players' do
  scenario 'i can attack player 2' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content 'You attacked Not John'
  end
  scenario 'reduce p2s hitpoints from 50 to 40HP' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content 'Not John hitpoints: 40HP'
  end
end

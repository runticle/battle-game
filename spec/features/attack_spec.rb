require 'capybara'
require 'capybara/rspec'

feature 'attacking players' do
  scenario 'i can attack player 2' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content 'John attacked Not John!'
  end
  scenario 'player 2 can attack player 1' do
    sign_in_and_play
    click_button 'Attack'
    click_button 'Attack'
    expect(page).to have_content 'Not John attacked John!'
  end
end

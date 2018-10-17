require 'capybara'
require 'capybara/rspec'

feature 'attcking players' do
  scenario 'i can attack player 2' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content "You attacked Not John"
  end
end

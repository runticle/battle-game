require 'capybara'
require 'capybara/rspec'

feature 'viewing hit points' do
  scenario 'can see player 2 hitpoints' do
    sign_in_and_play
    expect(page).to have_content 'Not John 100HP'
  end
end

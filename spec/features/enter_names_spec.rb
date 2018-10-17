# As two Players,
# So we can play a personalised game of Battle,
# We want to Start a fight by entering our names and seeing them
require 'capybara'
require 'capybara/rspec'

feature 'Entering player names' do
  scenario 'P1 and P2 enter names' do
    sign_in_and_play
    expect(page).to have_content 'John', 'Not John'
  end
end

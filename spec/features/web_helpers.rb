require 'capybara'
require 'capybara/rspec'

def sign_in_and_play
  visit ('/')
  fill_in('p1', with: 'John')
  fill_in('p2', with: 'Not John')
  click_button('Submit')
end

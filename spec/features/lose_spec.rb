feature 'a player can lose' do
  scenario 'player loses at 0HP' do
    sign_in_and_play
    click_button 'Attack'
    click_button 'Attack'
    click_button 'Attack'
    click_button 'Attack'
    click_button 'Attack'
    click_button 'Attack'
    click_button 'Attack'
    click_button 'Attack'
    click_button 'Attack'
    click_button 'Attack'
    click_button 'Attack'
    click_button 'Attack'
    click_button 'Attack'
    click_button 'Attack'
    click_button 'Attack'
    click_button 'Attack'
    click_button 'Attack'
    click_button 'Attack'
    click_button 'Attack'
    expect(page).to have_content 'John is dead!'
  end
end

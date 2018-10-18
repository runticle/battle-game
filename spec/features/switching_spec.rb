feature 'swtiching turns' do
  scenario 'p1 first first' do
    sign_in_and_play
    expect(page).to have_content "It's the turn of the mighty John"
  end
  scenario 'p2 attacks next' do
    sign_in_and_play
    click_button "Attack"
    expect(page).to have_content "It's the turn of the mighty Not John"
  end
end

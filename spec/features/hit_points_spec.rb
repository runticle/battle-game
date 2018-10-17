feature 'viewing hit points' do
  scenario 'can see player 2 hitpoints' do
    visit ('/')
    fill_in('p1', with: "John")
    fill_in('p2', with: "Not John")
    click_button("Submit")
    expect(page).to have_content "Not John hitpoints"
  end
end

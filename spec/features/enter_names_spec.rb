# As two Players,
# So we can play a personalised game of Battle,
# We want to Start a fight by entering our names and seeing them
feature "Entering player names" do
  scenario "P1 enters name" do
    visit('/')
    fill_in('p1', with: "John")
    click_button("Submit")
    expect(page).to have_content "John"
  end
  scenario "P2 enters name" do
    visit('/')
    fill_in('p2', with: "Not John")
    click_button("Submit")
    expect(page).to have_content "Not John"
  end

end

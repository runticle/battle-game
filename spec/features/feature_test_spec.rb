
feature 'Testing infrastructure' do
  scenario "app exists and has content" do
    visit('/')
    expect(page).to have_content "Testing infrastructure working!"
  end
end

feature "Visiting Homepage" do
  scenario "Users see homepage with greeting and links" do
    visit '/'
    expect(page).to have_content("Welcome to ApeBnB")
  end
end

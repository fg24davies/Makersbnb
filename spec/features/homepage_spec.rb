feature "Visiting Homepage" do
  scenario "Users see homepage with greeting and links" do
    visit '/'
    expect(page).to have_content("Welcome to ApeBnB")
    find_button("Sign-in").click
    find_button("View Listings").click
  end
end

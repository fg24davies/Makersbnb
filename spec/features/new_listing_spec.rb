feature 'User can create a new listing' do
  xscenario 'A user can list their room' do
    visit('/')
    click_button("View Listings")
    click_button("Post Listing")
    expect(current_path).to eq '/listings/new'
    expect(page).to have_field "title"
    expect(page).to have_field "price"
    expect(page).to have_field "description"
    # Needs a logged in user!!!
    find_button("Submit Listing").click
  end
end
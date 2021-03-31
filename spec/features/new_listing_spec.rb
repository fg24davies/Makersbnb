feature 'User can create a new listing' do
  xscenario 'A user can list their room' do
    visit('/')
    click_button("Post Listing")
    expect(current_path).to eq '/listings/new'
    fill_in("title", with: "Alecs Room")
    fill_in("price", with: "30") 
    fill_in("description", with: "My room whilst Im at my parents house")
    # Change username field to use session ID instead, when login is working
    fill_in("username", with: "alec_1")
    click_button("Submit Listing")
    expect(page).to have_content "Alecs Room: £30"
  end
end
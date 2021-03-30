feature "Visiting Homepage" do
  scenario "Users see homepage with greeting and links" do
    visit '/'
    expect(page).to have_content("Welcome to ApeBnB")
    expect(page).to have_button("Sign-up")
    expect(page).to have_button("View Listings")
  end

  scenario "user clicks on sign up link" do
    visit '/'
    click_button("Sign-up")
    expect(current_path).to eq "/sign_up" 
  end
end

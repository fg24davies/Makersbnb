feature "Visiting Homepage" do
  scenario "Users see homepage with greeting and links" do
    visit '/'
    expect(page).to have_content("ApeBnB")
    expect(page).to have_link("Sign Up", :href => "/sign_up")
    expect(page).to have_link("Login", :href => "/login")
  end

  scenario "user clicks on sign up link" do
    visit '/'
    click_on("Sign Up")
    expect(current_path).to eq "/sign_up" 
  end

  scenario "user clicks link to log in" do
    visit '/'
    click_on("Login")
    expect(current_path).to eq "/login" 
  end
end

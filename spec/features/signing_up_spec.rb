feature "Signing up" do

  scenario "submitted form data is saved to the database" do
    sign_up("Alec", "alecrox", "alec@alecrox.yoursox.com", "goorangutans")
    expect(page).to have_content('alecrox')
    expect(page).to have_link('Logout')
    expect(current_path).to eq '/'
  end
end

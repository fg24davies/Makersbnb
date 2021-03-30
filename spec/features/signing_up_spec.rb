feature "Signing up" do
  scenario "User fills out sign-up form" do
    visit '/'
    click_button("Sign-up")
    fill_in('name', with: 'Alec')
    fill_in('username', with: 'alecrox')
    fill_in('email', with: 'alec@alecrox.yoursox.com')
    fill_in('password', with: 'goorangutans')
    click_button("Submit")
  end
end

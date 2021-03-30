feature 'Log in' do
  
  scenario 'A registered user logs in, they are greeted' do
    log_in("taran_1", "password123")
    expect(page).to have_content("Welcome back taran_1")
  end
  
  scenario 'After a user logs in, the login form is not there' do
    log_in("taran_1", "password123")
    expect(page).not_to have_field("username")
    expect(page).not_to have_field("password")
    expect(page).not_to have_button("Log in")
  end

  scenario 'A user receives an username error message if username not found' do 
    log_in("taran51", "password123")
    expect(page).to have_content("Username not found! Try again or Sign Up")
  end

  scenario 'A user receives a password error message if incorrect password' do 
    log_in("taran_1", "fake_password")
    expect(page).to have_content("Incorrect password! Try again")
  end

end

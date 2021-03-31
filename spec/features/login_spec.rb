feature 'Log in' do
  
  scenario 'A registered user logs in, they are greeted' do
    sign_up(name: 'Taran', username: 'taran_23', email: 'taranisawesome@makers.com', password: 'password123')
    log_in(username: 'taran_23', password: 'password123')
    expect(page).to have_content("Welcome back taran_23")
  end
  
  scenario 'After a user logs in, the login form is not there' do
    sign_up(name: 'Taran', username: 'taran_23', email: 'taranisawesome@makers.com', password: 'password123')
    log_in(username: 'taran_23', password: 'password123')
    expect(page).not_to have_field("username")
    expect(page).not_to have_field("password")
    expect(page).not_to have_button("Log in")
  end

  scenario 'A user receives an username error message if username not found' do 
    log_in(username: "taran51", password: "password123")
    expect(page).to have_content("Username not found! Try again or Sign Up")
  end

  scenario 'A user receives a password error message if incorrect password' do 
    sign_up(name: 'Taran', username: 'taran_23', email: 'taranisawesome@makers.com', password: 'password123')
    log_in(username: 'taran_23', password: 'fakepassword')
    expect(page).to have_content("Incorrect password! Try again")
  end
end

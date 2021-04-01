feature 'Signing up' do
  scenario 'Submitting form redirects to welcome message' do
    sign_up(name: 'Alec', username: 'alecrox', email: 'alecrox@yoursox.com', password: 'alec123')
    expect(page).to have_content('Welcome to the ApeBnB family, Alec!')
    expect(current_path).to eq '/'
  end

  scenario "User can't sign-up if username already exists in database" do
    sign_up(name: 'Taran', username: 'taran_1', email: 'taranisawesome@makers.com', password: 'alec123')
    expect(page).to have_content('Username already in use; choose a different username or log-in')
    expect(page).not_to have_content('Welcome to the ApeBnB family')
  end

  scenario "User can't sign-up if email already exists in database" do
    sign_up(name: 'Taran', username: 'taran51', email: 'taran@bnb.com', password: 'alec123')
    expect(page).to have_content('E-mail already in use; choose a different e-mail or log-in')
    expect(page).not_to have_content('Welcome to the ApeBnB family')
  end
end

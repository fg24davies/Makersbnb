feature "Signing up" do
  scenario "User fills out sign-up form" do
    sign_up('alecrox', 'alecrox@yoursox.com')
  end

  scenario "Submitting form redirects to welcome message" do
    sign_up('alecrox', 'alecrox@yoursox.com')
    expect(page).to have_content('Welcome to the ApeBnB family!')
    expect(current_path).to eq '/user/welcome'
  end

  scenario "User can't sign-up if username already exists in database" do
    sign_up('taran_1', 'taranisawesome@makers.com')
    expect(page).to have_content('Username already in use; choose a different username or log-in')
    expect(page).not_to have_content('Welcome to the ApeBnB family!')
  end

  scenario "User can't sign-up if email already exists in database" do
    sign_up('taran51', 'taran@bnb.com')
    expect(page).to have_content('E-mail already in use; choose a different e-mail or log-in')
    expect(page).not_to have_content('Welcome to the ApeBnB family!')
  end
end

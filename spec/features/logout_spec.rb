feature 'Log out' do
  scenario 'A logged in user can log out' do
    sign_up(name: 'Taran', username: 'taran_23', email: 'taranisawesome@makers.com', password: 'password123')
    log_in(username: 'taran_23', password: 'password123')
    click_button('logout')
    expect(page).to have_content 'ApeBnB'
  end
end

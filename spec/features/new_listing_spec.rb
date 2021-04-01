feature 'Users can create new listings' do
  scenario 'A signed in user can list their room' do
    visit('/')
    log_in(username: 'taran_1', password: 'password123')
    click_button('Post Listing')
    expect(current_path).to eq '/listing/new'
    fill_in('title', with: 'Alecs Room')
    fill_in('price', with: '30')
    fill_in('description', with: 'My room whilst Im at my parents house')
    click_button('Submit Listing')
    expect(page).to have_content 'Alecs Room: £30'
  end
end

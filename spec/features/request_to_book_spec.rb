feature "Requesting to book a property" do
  scenario "Logged-in user can request to book for a particular date" do
    log_in(username: 'taran_1', password: 'password123')
    first('.listing').click_button('View')
    fill_in('date', with: '2021-04-15')
    click_button('Request to book')
    expect(page).to have_content('Thank you! Your booking request for Spare Room on 2021-04-15 has been sent.')
  end
end

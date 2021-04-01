feature 'viewing available listings' do
  scenario 'see a full list of available rooms' do
    visit('/')
    expect(page).to have_content 'Spare Room: £10'
    expect(page).to have_content 'Master Bedroom: £999'
  end

  scenario 'A user wants to view the first listing' do
    visit('/')
    first('.listing').click_button('View')
    expect(page).to have_content 'Spare Room'
    expect(page).to have_content '£10'
    expect(page).to have_content 'sofa bed in living area'
  end
end

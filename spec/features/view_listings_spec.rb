
feature 'viewing available listings' do 
  scenario 'see a full list of available rooms' do
    visit('/')
    click_button("View Listings")
    expect(current_path).to eq '/listings'
    expect(page).to have_content 'Spare Room: £10'
    expect(page).to have_content 'Master Bedroom: £999'
    expect(page).to have_content 'Room of Alec: £30'
  end 
end 

# 'Spare Room',	'sofa bed in living area',	'10',	'1');")
# ('Master Bedroom',	'ensuite available',	'999',	'1');")
# ('Room of Alec',	'my room while i stay at my parents',	'30',	'4');")

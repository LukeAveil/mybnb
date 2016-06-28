feature 'Specify availability' do

  scenario 'User can specify available dates' do
    signup
    visit '/spaces/new'
    fill_in 'name', with: "Luke's place"
    fill_in 'description', with: 'Nice place in Shoreditch'
    fill_in 'price', with: '200'
    fill_in 'date', with: '2016-08-16'
    click_button('List space')
    expect(current_path).to eq '/spaces'
    space = Space.first
    date = Date.parse('2016-08-16')
    expect(space.dates).to include('date')


  end

end

feature 'Specify availability' do

  scenario 'User can specify available dates' do
    signup
    listSpace
    expect(current_path).to eq '/spaces'
    space = Space.first
    date = Date.parse('2016-08-16')
    expect(space.available_dates.first.date).to eq(date)
  end

  scenario 'User can add additional available dates' do
    signup
    listSpace
    click_link 'view space'
    fill_in 'date', with: '2016-07-16'
    click_button('add availability')
    space = Space.first
    date = Date.parse('2016-07-16')
    expect(space.available_dates.last.date).to eq(date)
  end

end

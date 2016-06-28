feature 'Specify availability' do

  scenario 'User can specify available dates' do
    signup
    listSpace
    expect(current_path).to eq '/spaces'
    space = Space.first
    date = Date.parse('2016-08-16')
    expect(space.available_dates.first.date).to eq(date)
  end

end

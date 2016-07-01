feature 'Date handling' do

  scenario 'User can specify available dates' do
    signup
    listSpace
    expect(current_path).to eq '/spaces'
    space = Space.last
    first_date = Date.parse('2016-07-10')
    last_date = Date.parse('2016-07-18')
    expect(space.available_dates.first.date).to eq(first_date)
    expect(space.available_dates.last.date).to eq(last_date)
  end

  scenario 'User can add additional available dates' do
    signup
    listSpace
    click_link 'view space'
    fill_in 'date', with: '2016-07-19'
    click_button('add availability')
    space = Space.first
    date = Date.parse('2016-07-19')
    expect(space.available_dates.last.date).to eq(date)
  end

  scenario 'Only a spaces owner can add available dates' do
    signup
    listSpace
    click_button('Sign out')
    signup(email: 'jeff@jeff.com')
    click_link 'view space'
    expect(page).not_to have_button('add availability')
  end

  scenario 'upon booking, booking date removed from available dates' do
    makeRequest
    # expect(Space.first.available_dates.first.date).to eq Date.parse('2016-08-16')
    # click_button "Approve"
    # expect(Space.first.available_dates).to be_empty
    click_button "Approve"
    expect(Space.first.available_dates.map{|av_date| av_date.date}).not_to include Date.parse('2016-07-14')
  end

  scenario 'upon approval, other requests for that space and date are rejected' do
    makeRequest
    click_button "Sign out"
    signup(email: 'jeff@jeff.com')
    visit '/spaces'
    click_link "view space"
    fill_in :requested_date, with: "14/07/2016"
    click_button "confirm request"
    click_button "Sign out"
    signin
    visit '/requests'
    within 'section#request_4' do
      click_button 'Approve'
    end
    expect(Request.first.confirmed).to eq 1
  end

  scenario 'User cannot add a date that has been confirmed' do
    makeRequest
    click_button 'Approve'
    expect(Space.last.available_dates.length).to eq(8)
    visit '/spaces'
    click_link 'view space'
    fill_in 'date', with: '2016-07-14'
    click_button('add availability')
    expect(page).to have_content('Date already booked')
    expect(Space.last.available_dates.length).to eq(8)
  end
end

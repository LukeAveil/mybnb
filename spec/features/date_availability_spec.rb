feature 'Date handling' do

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
    expect(Space.first.available_dates.first.date).to eq Date.parse('2016-08-16')
    click_button "Approve"
    expect(Space.first.available_dates).to be_empty
  end

  scenario 'upon approval, other requests for that space and date are rejected' do
    makeRequest
    click_button "Sign out"
    signup(email: 'jeff@jeff.com')
    visit '/spaces'
    click_link "view space"
    fill_in :requested_date, with: "16/08/2016"
    click_button "confirm request"
    click_button "Sign out"
    signin
    visit '/requests'
    within 'section#request_2' do
      click_button 'Approve'
    end
    expect(Request.last.confirmed).to eq 1
  end

  scenario 'User cannot add a date that has been confirmed' do
    makeRequest
    click_button 'Approve'
    expect(Space.last.available_dates.length).to eq(0)
    visit '/spaces'
    click_link 'view space'
    fill_in 'date', with: '2016-08-16'
    click_button('add availability')
    expect(page).to have_content('Date already booked')
    expect(Space.last.available_dates.length).to eq(0)
  end
end

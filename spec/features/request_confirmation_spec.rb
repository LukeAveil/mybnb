feature 'User can approve requests' do

  scenario 'Can see pending requests' do
    signup
    listSpace
    signup(email: 'ken@ken.com')
    visit '/spaces'
    click_link "view space"
		click_link "2016-08-16"
		click_button "confirm request"
    signin
    visit '/requests'
    expect(page).to have_content("Luke's place")
  end

  scenario 'Can approve request' do
    signup
    listSpace
    signup(email: 'ken@ken.com')
    visit '/spaces'
    click_link "view space"
    click_link "2016-08-16"
    click_button "confirm request"
    signin
    visit '/requests'
    expect(page).to have_content 'Approve'
    click_link 'Approve'
    expect(Request.first.confirmed).to eq '2'
  end

end

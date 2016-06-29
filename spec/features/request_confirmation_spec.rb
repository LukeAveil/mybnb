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
    signup(email: 'bob@bob.com')
    listSpace
    signup(email: 'ben@ben.com')
    visit '/spaces'
    click_link "view space"
		click_link "2016-08-16"
		click_button "confirm request"
    signin(email: 'bob@bob.com')
    visit '/requests'
    click_button "Approve"
    expect(Request.first.confirmed).to eq 2
  end

end

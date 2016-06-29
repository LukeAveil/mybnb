feature 'User can approve requests' do

  before(:each) do
    signup
    listSpace
    click_button 'sign out'
    signup(email: 'ken@ken.com')
    visit '/spaces'
    click_link "view space"
		click_link "2016-08-16"
		click_button "confirm request"
    signin
    visit '/requests'
  end

  scenario 'Can see pending requests' do
    expect(page).to have_content("Luke's place")
  end

  scenario 'Can approve request' do
    click_button "Approve"
    expect(Request.first.confirmed).to eq 2
  end

end

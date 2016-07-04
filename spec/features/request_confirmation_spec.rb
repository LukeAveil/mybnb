feature 'User can approve requests' do

  scenario 'Can see pending requests' do
    make_request
    expect(page).to have_content("Luke's place")
  end

  scenario 'Can approve request' do
    make_request
    click_button "Approve"
    expect(Request.first.confirmed).to eq 2
  end

end

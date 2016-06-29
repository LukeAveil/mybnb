feature 'User can approve requests' do

  scenario 'Can see pending requests' do
    makeRequest
    expect(page).to have_content("Luke's place")
  end

  scenario 'Can approve request' do
    makeRequest
    click_button "Approve"
    expect(Request.first.confirmed).to eq 2
  end

end

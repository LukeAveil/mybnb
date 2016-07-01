feature 'Users can have a conversation about a booking' do

  scenario 'Space owner can send a message' do
    makeRequest
    click_button "Approve"
    visit '/requests'
    click_link "Luke's place"
    fill_in 'message', with: 'Thanks for booking!'
    click_button 'send'
    expect(page).to have_content 'Thanks for booking!'
  end

  scenario 'Space renter can send a message' do
    makeRequest
    click_button "Approve"
    click_button "Sign out"
    signin(email: 'ken@ken.com')
    visit '/requests'
    click_link "Luke's place"
    fill_in 'message', with: 'Thanks for letting me book!'
    click_button 'send'
    expect(page).to have_content 'Thanks for letting me book!'
  end


end

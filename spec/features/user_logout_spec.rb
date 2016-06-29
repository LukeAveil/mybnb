feature 'User can sign out' do

  scenario 'When signed in, can sign out' do
    signup
    click_button 'Sign Out'
    expect(page).to have_content "Already registered?"
  end

end

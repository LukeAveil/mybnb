feature 'User can sign out' do

  scenario 'When signed in, can sign out' do
    signup
    click_button 'Sign out'
    expect(page).to have_content "not logged in"
  end

end

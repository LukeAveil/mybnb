feature "User sign-up" do

  scenario "User can register" do
    signup
    expect(page).to have_content "joe@joemail.com"
    expect(User.first.email).to eq "joe@joemail.com"
  end

  scenario "User can't register with different passwords" do
    signup(password: "schmecret")
    expect(page).to have_content "Passwords did not match"
    expect(User.count).to eq 0
  end

  scenario "User can't register with duplicate email" do
    signup
    click_button 'Sign Out'
    signup
    expect(page).to have_content "This email address is already taken"
    expect(User.count).to eq 1
  end

end

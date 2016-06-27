feature "User login" do

  scenario "user can login with correct details" do
    signup
    signin

    expect(page).to have_content "joe@joemail.com"
  end

  scenario "user can't login with incorrect email" do
    signup
    signin(email: "boe@joemail.com")

    expect(page).to have_content "Invalid email or password"
  end

  scenario "user can't login with incorrect password" do
    signup
    signin(password: "schmecret")

    expect(page).to have_content "Invalid email or password"
  end

end

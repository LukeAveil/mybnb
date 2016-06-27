require 'spec_helper'

feature "User sign-up" do

  scenario "User can register" do
    visit '/'
    fill_in :email, with: "joe@joemail.com"
    fill_in :password, with: "secret"
    fill_in :password_confirmation, with: "secret"
    click_button "sign up"
    expect(page).to have_content "Book a Space"
    expect(User.first.email).to eq "joe@joemail.com"
  end

end

def signup(email: "joe@joemail.com",
           password: "secret",
           password_confirmation: "secret")
  visit '/'
  within('#signup_overlay') do
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button "sign up"
  end
end

def signin(email: "joe@joemail.com",
           password: "secret")
  visit "/"
  within('#login_overlay') do
    fill_in :email, with: email
    fill_in :password, with: password
    click_button "log in"
  end
end

def list_space
  visit '/list_space'
  fill_in 'name', with: "Luke's place"
  fill_in 'description', with: 'Nice place in Shoreditch'
  fill_in 'price', with: '200'
  fill_in 'start_date', with: '2016-07-10'
  fill_in 'end_date', with: '2016-07-18'
  attach_file 'photo', "spec/support/uploads/croc2.jpg"
  click_button('List space')
end

def make_request
  signup
  list_space
  click_button 'Sign out'
  signup(email: 'ken@ken.com')
  visit '/spaces'
  click_link "view space"
  fill_in :requested_date, with: "14/07/2016"
  click_button "confirm request"
  click_button('Sign out')
  signin
  visit '/requests'
end

def list_another_space
  click_button('Sign out')
  signup(email: 'ken@ken.com')
  visit '/list_space'
  fill_in 'name', with: "Ken's place"
  fill_in 'description', with: 'Nice place in Holborn'
  fill_in 'price', with: '150'
  fill_in 'start_date', with: '2016-07-11'
  fill_in 'end_date', with: '2016-07-17'
  attach_file 'photo', "spec/support/uploads/croc2.jpg"
  click_button('List space')
  click_button('Sign out')
end

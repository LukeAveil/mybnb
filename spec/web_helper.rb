def signup(email: "joe@joemail.com",
           password: "secret",
           password_confirmation: "secret")
  visit '/'
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button "sign up"
end

def signin(email: "joe@joemail.com",
           password: "secret")
  visit "/sessions/new"
  fill_in :email, with: email
  fill_in :password, with: password
  click_button "log in"
end

def listSpace
  visit '/listSpace'
  fill_in 'name', with: "Luke's place"
  fill_in 'description', with: 'Nice place in Shoreditch'
  fill_in 'price', with: '200'
  fill_in 'date', with: '2016-08-16'
  click_button('List space')
end

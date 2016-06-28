require 'spec_helper'

feature 'List a space' do

  scenario 'User can list a space' do
      signup
      visit '/spaces/new'
      fill_in 'name', with: "Luke's place"
      fill_in 'description', with: 'Nice place in Shoreditch'
      fill_in 'price', with: '200'
      click_button('List space')
      expect(current_path).to eq '/spaces'

      within 'ul#spaces' do
        expect(page).to have_content("Luke's place")
      end
  end

end

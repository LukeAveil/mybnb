require 'spec_helper'

feature 'List a space' do

  scenario 'User can list a space' do
      signup
      listSpace
      expect(current_path).to eq '/spaces'

      within 'ul#spaces' do
        expect(page).to have_content("Luke's place")
      end
  end

  scenario 'User can upload an image' do
    signup
    listSpace
    space = Space.last
    expect(space.photo).to eq "croc2.jpg"
    visit "spaces/#{space.id}"
    expect(page).to have_xpath "//img[@src='/image_uploads/croc2.jpg']"
  end

end

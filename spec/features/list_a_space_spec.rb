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

end

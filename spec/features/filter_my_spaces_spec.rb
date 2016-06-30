feature 'Filter Spaces' do

  scenario 'User can filter to see their own spaces' do
      signup
      listSpace
      listanotherSpace
      signin
      click_link('My spaces')
      expect(current_path).to eq '/my_spaces'
      expect(page).to have_content("Luke's place")
      expect(page).not_to have_content("Ken's place")
  end
end

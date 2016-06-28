feature "Booking a space" do

	scenario "User clicks date" do
		visit '/spaces/1'
		click_link("2016-09-12")
		expect(page).to have_content "Requested Date: 2016-09-12"
	end 
end
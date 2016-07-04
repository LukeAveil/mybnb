feature "Booking a space" do
	scenario "User confirms request" do
		signup
		list_space
		click_button "Sign out"
		signup(email: "jeff@jeff.com")
		click_link "view space"
		fill_in :requested_date, with: "16/07/2016"
		click_button "confirm request"
		expect(current_path).to eq "/requests"
		expect(page).to have_content("Luke's place")
		expect(page).to have_content("Not confirmed")
		expect(page).to have_content("2016-07-16")
	end
end

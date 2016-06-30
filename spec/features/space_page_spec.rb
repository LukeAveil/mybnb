feature "Booking a space" do
	scenario "User confirms request" do
		signup
		listSpace
		click_button "Sign Out"
		signup(email: "jeff@jeff.com")
		click_link "view space"
		fill_in :requested_date, with: "16/08/2016"
		click_button "confirm request"
		expect(current_path).to eq "/requests"
		expect(page).to have_content("Luke's place")
		expect(page).to have_content("Not confirmed")
		expect(page).to have_content("2016-08-16")
	end
end

feature "Booking a space" do

	scenario "User selects date" do
		signup
		listSpace
		click_link "view space"
		click_link "2016-08-16"
		expect(page).to have_xpath("//input[@value='2016-08-16']")
	end

	scenario "User confirms request" do
		signup
		listSpace
		click_link "view space"
		click_link "2016-08-16"
		click_button "confirm request"
		expect(current_path).to eq "/requests"
		expect(page).to have_content("Luke's place")
		expect(page).to have_content("Not confirmed")
		expect(page).to have_content("2016-08-16")
	end
end

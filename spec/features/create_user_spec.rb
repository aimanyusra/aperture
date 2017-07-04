require	'rails_helper'
# capybara test syntax

feature "User sign up" do 
	scenario "successfully" do
		visit sign_up_path

		fill_in "user[name]", with: "Test Account"
		fill_in "user[email]", with: "test@test.com"
		fill_in "user[password]", with: "testtest"
		fill_in "user[password_confirmation]", with: "testtest"
		click_on "Join"

		expect(page).to have_content("Test Account")

	end
end
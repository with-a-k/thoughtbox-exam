require "test_helper"

feature "SignupPage" do
  scenario "root displays login/signup prompt", js: true do
    visit root_path
    page.must_have_content "Log In or Sign Up"
  end
end

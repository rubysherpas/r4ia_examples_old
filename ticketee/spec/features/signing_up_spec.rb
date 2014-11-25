require "rails_helper"

feature "Sign up" do
  it "a user can sign up" do
    visit "/"
    click_link "Sign up"
    fill_in "Email", with: "test@example.com"
    fill_in "user_password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    expect(page).to have_content("You have signed up successfully.")
  end
end

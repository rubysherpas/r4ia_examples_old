require "rails_helper"

feature "Sign in" do
  let!(:user) { FactoryGirl.create(:user) }

  it "a user can sign in" do
    visit "/"
    click_link "Sign in"
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_button "Log in"
    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Signed in as #{user.email}")
  end
end

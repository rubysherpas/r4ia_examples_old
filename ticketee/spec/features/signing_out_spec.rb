require "rails_helper"

feature "Signing out" do
  let!(:user) { FactoryGirl.create(:user) }

  before { login_as(user) }

  it "can sign out" do
    visit "/"
    click_link "Sign out"
    expect(page).to have_content("You have signed out.")
  end
end

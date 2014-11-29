require "rails_helper"

feature "Sign in" do
  let!(:user) { FactoryGirl.create(:user) }

  before do
    login_as(user)
  end

  it "a user can sign in" do
    visit "/"
    click_link "Sign out"
    expect(page).to have_content("Signed out successfully.")
  end
end

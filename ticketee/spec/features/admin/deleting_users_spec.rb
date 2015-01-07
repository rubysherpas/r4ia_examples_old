require "rails_helper"

RSpec.feature "An admin can delete users" do
  let!(:admin_user) { FactoryGirl.create(:user, :admin) }
  let!(:user) { FactoryGirl.create(:user) }

  before do
    login_as(admin_user)
    visit "/"

    click_link "Admin"
    click_link "Users"
  end

  scenario "successfully" do
    click_link user.email
    click_link "Delete User"

    expect(page).to have_content("User has been deleted")
  end

  scenario "but cannot delete themselves" do
    click_link admin_user.email
    click_link "Delete User"

    expect(page).to have_content("You cannot delete yourself!")
  end
end

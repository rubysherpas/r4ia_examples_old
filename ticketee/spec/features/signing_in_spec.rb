require "rails_helper"

feature "signing in" do
  scenario "Signing in via form" do
    user = FactoryGirl.create(:user)

    visit "/"
    click_link "Sign in"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"

    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Signed in as #{user.email}")
  end

  scenario "Cannot sign in with invalid credentials" do
    user = FactoryGirl.create(:user)

    visit "/"
    click_link "Sign in"
    fill_in "Email", with: user.email
    fill_in "Password", with: 'wrongpassword'
    click_button "Sign in"

    expect(page).to have_content("Invalid email or password.")
    expect(page.current_path).to eq(sign_in_path)
  end
end

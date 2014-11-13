require "rails_helper"

feature "Creating Tickets" do
  let(:user) { FactoryGirl.create(:user) }

  before do
    project = FactoryGirl.create(:project, name: "Internet Explorer")

    visit '/'
    click_link project.name
    click_link "New Ticket"
    message = "You need to sign in or sign up before continuing."
    expect(page).to have_content(message)

    fill_in "Email", with: user.email
    fill_in "Password", with: 'password'
    click_button "Sign in"

    click_link project.name
    click_link "New Ticket"
  end

  scenario "Creating a ticket" do
    fill_in "Title", with: "Non-standards compliance"
    fill_in "Description", with: "My pages are ugly!"
    click_button "Create Ticket"

    expect(page).to have_content("Ticket has been created.")
    within "#ticket #author" do
      expect(page).to have_content("Created by #{user.email}")
    end
  end

  scenario "Creating a ticket without valid attributes fails" do
    click_button "Create Ticket"

    expect(page).to have_content("Ticket has not been created.")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Description can't be blank")
  end

  scenario "Description must be longer than 10 characters" do
    fill_in "Title", with: "Non-standards compliance"
    fill_in "Description", with: "it sucks"
    click_button "Create Ticket"

    expect(page).to have_content("Ticket has not been created.")
    expect(page).to have_content("Description is too short")
  end
end

require "rails_helper"

feature "Viewing tickets" do
  before do
    user = FactoryGirl.create(:user)
    sublime = FactoryGirl.create(:project, name: "Sublime Text 3")

    FactoryGirl.create(:ticket,
      project: sublime,
      title: "Make it shiny!",
      description: "Gradients! Starbursts! Oh my!",
      author: user)

    ie = FactoryGirl.create(:project, name: "Internet Explorer")
    FactoryGirl.create(:ticket,
      project: ie,
      title: "Standards compliance",
      description: "Isn't a joke.",
      author: user)

    visit "/"
  end

  scenario "Viewing tickets for a given project" do
    click_link "Sublime Text 3"

    expect(page).to have_content("Make it shiny!")
    expect(page).to_not have_content("Standards compliance")

    click_link "Make it shiny!"
    within("#ticket h2") do
      expect(page).to have_content("Make it shiny!")
    end

    expect(page).to have_content("Gradients! Starbursts! Oh my!")
  end
end

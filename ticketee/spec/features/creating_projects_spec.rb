require 'rails_helper'

feature 'Creating Projects' do
  scenario "can create a project" do
    visit '/'
    click_link 'New Project'
    fill_in 'Name', with: 'Sublime Text 3'
    fill_in 'Description', with: 'A text-editor for all operating systems'
    click_button 'Create Project'
    expect(page).to have_content('Project has been created.')

    project = Project.find_by(name: "Sublime Text 3")
    expect(page.current_url).to eql(project_url(project))
    title = "Sublime Text 3 - Projects - Ticketee"
    expect(page).to have_title(title)
  end
end

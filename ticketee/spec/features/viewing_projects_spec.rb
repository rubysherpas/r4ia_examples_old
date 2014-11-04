require 'rails_helper'

feature 'Viewing projects' do
  scenario 'Listing all projects' do
    project = FactoryGirl.create(:project, name: 'Sublime Text 3')
    visit '/'
    click_link 'Sublime Text 3'
    expect(page.current_url).to eql(project_url(project))
  end
end

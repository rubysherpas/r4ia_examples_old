require "rails_helper"

RSpec.feature "Authorization errors" do
  let(:project) { FactoryGirl.create :project }

  scenario "are handled gracefully" do
    visit project_path(project)

    expect(page.current_path).to eq(root_path)
    expect(page).to have_content("You aren't allowed to do that.")
  end
end

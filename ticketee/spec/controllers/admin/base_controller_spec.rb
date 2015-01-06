require "rails_helper"

RSpec.describe Admin::BaseController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }

  before do
    allow(controller).to receive(:authenticate_user!)
    allow(controller).to receive(:current_user).and_return(user)
  end

  context "standard users" do
    it "are not able to access the index action" do
      get :index

      expect(response).to redirect_to("/")
      expect(flash[:alert]).to eql("You must be an admin to do that.")
    end
  end
end

require "rails_helper"

RSpec.describe "projects#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/projects/#{project.id}", {}
  end

  describe "basic destroy" do
    let!(:project) { create(:project) }

    it "destroys the resource" do
      expect(ProjectResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect { project.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end

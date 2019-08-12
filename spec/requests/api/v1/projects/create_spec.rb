require "rails_helper"

RSpec.describe "projects#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/projects", payload
  end

  describe "basic create" do
    let(:params) { attributes_for(:project) }

    let(:payload) do
      {
        data: {
          type: "projects",
          attributes: params,
        },
      }
    end

    it "works" do
      expect(ProjectResource).to receive(:build).and_call_original
      expect { make_request }.to change { Project.count }.by(1)
      expect(response.status).to eq(201)
    end
  end
end

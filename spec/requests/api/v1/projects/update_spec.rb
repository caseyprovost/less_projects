require 'rails_helper'

RSpec.describe "projects#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/projects/#{project.id}", payload
  end

  describe 'basic update' do
    let!(:project) { create(:project) }

    let(:payload) do
      {
        data: {
          id: project.id.to_s,
          type: 'projects',
          attributes: {
            name: "new name"
          }
        }
      }
    end

    it 'updates the resource' do
      expect(ProjectResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(project.reload.name).to eq("new name")
    end
  end
end

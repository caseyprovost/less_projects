require 'rails_helper'

RSpec.describe "todo_lists#create", type: :request do
  let!(:project) { create(:project) }

  subject(:make_request) do
    jsonapi_post "/api/v1/todo_lists", payload
  end

  describe 'basic create' do
    let(:params) { attributes_for(:todo_list) }

    let(:payload) do
      {
        data: {
          type: 'todo_lists',
          attributes: params,
          relationships: {
            project: {
              data: {
                type: 'projects',
                id: project.id
              }
            }
          }
        }
      }
    end

    it 'works' do
      expect(TodoListResource).to receive(:build).and_call_original
      expect { make_request }.to change { TodoList.count }.by(1)
      expect(response.status).to eq(201)
    end
  end
end

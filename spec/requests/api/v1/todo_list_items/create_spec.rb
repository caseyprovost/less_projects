require "rails_helper"

RSpec.describe "todo_list_items#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/todo_list_items", payload
  end

  describe "basic create" do
    let(:params) { attributes_for(:todo_list_item) }
    let!(:todo_list) { create(:todo_list) }

    let(:payload) do
      {
        data: {
          type: "todo_list_items",
          attributes: params,
          relationships: {
            todo_list: {
              data: {
                type: "todo_lists",
                id: todo_list.id,
              },
            },
          },
        },
      }
    end

    it "works" do
      expect(TodoListItemResource).to receive(:build).and_call_original
      expect { make_request }.to change { TodoListItem.count }.by(1)
      expect(response.status).to eq(201)
    end
  end
end

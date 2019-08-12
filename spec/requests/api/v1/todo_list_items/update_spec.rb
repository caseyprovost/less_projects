require "rails_helper"

RSpec.describe "todo_list_items#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/todo_list_items/#{todo_list_item.id}", payload
  end

  describe "basic update" do
    let!(:todo_list_item) { create(:todo_list_item) }

    let(:payload) do
      {
        data: {
          id: todo_list_item.id.to_s,
          type: "todo_list_items",
          attributes: {
            content: "break the dishes!",
          },
        },
      }
    end

    it "updates the resource" do
      expect(TodoListItemResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(todo_list_item.reload.content).to eq("break the dishes!")
    end
  end
end

require "rails_helper"

RSpec.describe "todo_lists#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/todo_lists/#{todo_list.id}", payload
  end

  describe "basic update" do
    let!(:todo_list) { create(:todo_list) }

    let(:payload) do
      {
        data: {
          id: todo_list.id.to_s,
          type: "todo_lists",
          attributes: {
            name: "new name",
          },
        },
      }
    end

    it "updates the resource" do
      expect(TodoListResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)

      expect(todo_list.reload.name).to eq("new name")
    end
  end
end

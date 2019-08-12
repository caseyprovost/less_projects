require "rails_helper"

RSpec.describe "todo_lists#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/todo_lists/#{todo_list.id}", params: params
  end

  describe "basic fetch" do
    let!(:todo_list) { create(:todo_list) }

    it "works" do
      expect(TodoListResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("todo_lists")
      expect(d.id).to eq(todo_list.id)
    end
  end
end

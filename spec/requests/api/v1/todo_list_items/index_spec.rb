require "rails_helper"

RSpec.describe "todo_list_items#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/todo_list_items", params: params
  end

  describe "basic fetch" do
    let!(:todo_list_item1) { create(:todo_list_item) }
    let!(:todo_list_item2) { create(:todo_list_item) }

    it "works" do
      expect(TodoListItemResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["todo_list_items"])
      expect(d.map(&:id)).to match_array([todo_list_item1.id, todo_list_item2.id])
    end
  end
end

require "rails_helper"

RSpec.describe "todo_lists#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/todo_lists", params: params
  end

  describe "basic fetch" do
    let!(:todo_list1) { create(:todo_list) }
    let!(:todo_list2) { create(:todo_list) }

    it "works" do
      expect(TodoListResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.map(&:jsonapi_type).uniq).to match_array(["todo_lists"])
      expect(d.map(&:id)).to match_array([todo_list1.id, todo_list2.id])
    end
  end
end

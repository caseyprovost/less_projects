require 'rails_helper'

RSpec.describe "todo_list_items#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/todo_list_items/#{todo_list_item.id}", params: params
  end

  describe 'basic fetch' do
    let!(:todo_list_item) { create(:todo_list_item) }

    it 'works' do
      expect(TodoListItemResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('todo_list_items')
      expect(d.id).to eq(todo_list_item.id)
    end
  end
end

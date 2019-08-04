require 'rails_helper'

RSpec.describe "todo_list_items#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/todo_list_items/#{todo_list_item.id}", {}
  end

  describe 'basic destroy' do
    let!(:todo_list_item) { create(:todo_list_item) }

    it 'destroys the resource' do
      expect(TodoListItemResource).to receive(:find).and_call_original
      expect { make_request}.to change { TodoListItem.count }.by(-1)
      expect(response.status).to eq(200)
      expect { todo_list_item.reload }.to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end

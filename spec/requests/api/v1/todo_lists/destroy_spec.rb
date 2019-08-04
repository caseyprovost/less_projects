require 'rails_helper'

RSpec.describe "todo_lists#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/todo_lists/#{todo_list.id}", {}
  end

  describe 'basic destroy' do
    let!(:todo_list) { create(:todo_list) }

    it 'destroys the resource' do
      expect(TodoListResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect { todo_list.reload }.to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end

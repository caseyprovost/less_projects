require 'rails_helper'

RSpec.describe TodoListItemResource, type: :resource do
  describe 'serialization' do
    let!(:todo_list_item) { create(:todo_list_item) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(todo_list_item.id)
      expect(data.jsonapi_type).to eq('todo_list_items')
    end
  end

  describe 'filtering' do
    let!(:todo_list_item1) { create(:todo_list_item) }
    let!(:todo_list_item2) { create(:todo_list_item) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: todo_list_item2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([todo_list_item2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:todo_list_item1) { create(:todo_list_item) }
      let!(:todo_list_item2) { create(:todo_list_item) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            todo_list_item1.id,
            todo_list_item2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            todo_list_item2.id,
            todo_list_item1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end

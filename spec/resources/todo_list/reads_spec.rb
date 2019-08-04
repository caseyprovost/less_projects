require 'rails_helper'

RSpec.describe TodoListResource, type: :resource do
  describe 'serialization' do
    let!(:todo_list) { create(:todo_list) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(todo_list.id)
      expect(data.jsonapi_type).to eq('todo_lists')
    end
  end

  describe 'filtering' do
    let!(:todo_list1) { create(:todo_list) }
    let!(:todo_list2) { create(:todo_list) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: todo_list2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([todo_list2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:todo_list1) { create(:todo_list) }
      let!(:todo_list2) { create(:todo_list) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            todo_list1.id,
            todo_list2.id
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
            todo_list2.id,
            todo_list1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end

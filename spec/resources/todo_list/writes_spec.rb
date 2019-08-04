require 'rails_helper'

RSpec.describe TodoListResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'todo_lists',
          attributes: attributes_for(:todo_list)
        }
      }
    end

    let(:instance) do
      TodoListResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { TodoList.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:todo_list) { create(:todo_list) }

    let(:payload) do
      {
        data: {
          id: todo_list.id.to_s,
          type: 'todo_lists',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      TodoListResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { todo_list.reload.updated_at }
      # .and change { todo_list.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:todo_list) { create(:todo_list) }

    let(:instance) do
      TodoListResource.find(id: todo_list.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { TodoList.count }.by(-1)
    end
  end
end

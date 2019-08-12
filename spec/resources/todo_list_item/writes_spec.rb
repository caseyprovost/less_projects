require "rails_helper"

RSpec.describe TodoListItemResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "todo_list_items",
          attributes: attributes_for(:todo_list_item),
        },
      }
    end

    let(:instance) do
      TodoListItemResource.build(payload)
    end

    it "works" do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { TodoListItem.count }.by(1)
    end
  end

  describe "updating" do
    let!(:todo_list_item) { create(:todo_list_item) }

    let(:payload) do
      {
        data: {
          id: todo_list_item.id.to_s,
          type: "todo_list_items",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      TodoListItemResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { todo_list_item.reload.updated_at }
      # .and change { todo_list_item.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:todo_list_item) { create(:todo_list_item) }

    let(:instance) do
      TodoListItemResource.find(id: todo_list_item.id)
    end

    it "works" do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { TodoListItem.count }.by(-1)
    end
  end
end

class TodoListItemsController < ApplicationController
  def index
    todo_list_items = TodoListItemResource.all(params)
    respond_with(todo_list_items)
  end

  def show
    todo_list_item = TodoListItemResource.find(params)
    respond_with(todo_list_item)
  end

  def create
    todo_list_item = TodoListItemResource.build(params)

    if todo_list_item.save
      render jsonapi: todo_list_item, status: 201
    else
      render jsonapi_errors: todo_list_item
    end
  end

  def update
    todo_list_item = TodoListItemResource.find(params)

    if todo_list_item.update_attributes
      render jsonapi: todo_list_item
    else
      render jsonapi_errors: todo_list_item
    end
  end

  def destroy
    todo_list_item = TodoListItemResource.find(params)

    if todo_list_item.destroy
      render jsonapi: {meta: {}}, status: 200
    else
      render jsonapi_errors: todo_list_item
    end
  end
end

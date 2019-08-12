class TodoListsController < ApplicationController
  def index
    todo_lists = TodoListResource.all(params)
    respond_with(todo_lists)
  end

  def show
    todo_list = TodoListResource.find(params)
    respond_with(todo_list)
  end

  def create
    todo_list = TodoListResource.build(params)

    if todo_list.save
      render jsonapi: todo_list, status: 201
    else
      render jsonapi_errors: todo_list
    end
  end

  def update
    todo_list = TodoListResource.find(params)

    if todo_list.update_attributes
      render jsonapi: todo_list
    else
      render jsonapi_errors: todo_list
    end
  end

  def destroy
    todo_list = TodoListResource.find(params)

    if todo_list.destroy
      render jsonapi: {meta: {}}, status: 200
    else
      render jsonapi_errors: todo_list
    end
  end
end

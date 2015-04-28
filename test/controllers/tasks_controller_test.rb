require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  setup do
    @task = tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post :create, task: { created_by: @task.created_by, deleted_at: @task.deleted_at, description: @task.description, is_active: @task.is_active, is_deleted: @task.is_deleted, name: @task.name, task_or_story_identifier: @task.task_or_story_identifier, task_type_id: @task.task_type_id, updated_by: @task.updated_by }
    end

    assert_redirected_to task_path(assigns(:task))
  end

  test "should show task" do
    get :show, id: @task
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @task
    assert_response :success
  end

  test "should update task" do
    patch :update, id: @task, task: { created_by: @task.created_by, deleted_at: @task.deleted_at, description: @task.description, is_active: @task.is_active, is_deleted: @task.is_deleted, name: @task.name, task_or_story_identifier: @task.task_or_story_identifier, task_type_id: @task.task_type_id, updated_by: @task.updated_by }
    assert_redirected_to task_path(assigns(:task))
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete :destroy, id: @task
    end

    assert_redirected_to tasks_path
  end
end

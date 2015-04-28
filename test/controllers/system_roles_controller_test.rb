require 'test_helper'

class SystemRolesControllerTest < ActionController::TestCase
  setup do
    @system_role = system_roles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:system_roles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create system_role" do
    assert_difference('SystemRole.count') do
      post :create, system_role: { deleted_at: @system_role.deleted_at, description: @system_role.description, is_active: @system_role.is_active, is_deleted: @system_role.is_deleted, is_editable: @system_role.is_editable, name: @system_role.name }
    end

    assert_redirected_to system_role_path(assigns(:system_role))
  end

  test "should show system_role" do
    get :show, id: @system_role
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @system_role
    assert_response :success
  end

  test "should update system_role" do
    patch :update, id: @system_role, system_role: { deleted_at: @system_role.deleted_at, description: @system_role.description, is_active: @system_role.is_active, is_deleted: @system_role.is_deleted, is_editable: @system_role.is_editable, name: @system_role.name }
    assert_redirected_to system_role_path(assigns(:system_role))
  end

  test "should destroy system_role" do
    assert_difference('SystemRole.count', -1) do
      delete :destroy, id: @system_role
    end

    assert_redirected_to system_roles_path
  end
end

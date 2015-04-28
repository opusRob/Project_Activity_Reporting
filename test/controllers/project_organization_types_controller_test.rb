require 'test_helper'

class ProjectOrganizationTypesControllerTest < ActionController::TestCase
  setup do
    @project_organization_type = project_organization_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_organization_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_organization_type" do
    assert_difference('ProjectOrganizationType.count') do
      post :create, project_organization_type: { deleted_at: @project_organization_type.deleted_at, description: @project_organization_type.description, is_active: @project_organization_type.is_active, is_deleted: @project_organization_type.is_deleted, name: @project_organization_type.name }
    end

    assert_redirected_to project_organization_type_path(assigns(:project_organization_type))
  end

  test "should show project_organization_type" do
    get :show, id: @project_organization_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_organization_type
    assert_response :success
  end

  test "should update project_organization_type" do
    patch :update, id: @project_organization_type, project_organization_type: { deleted_at: @project_organization_type.deleted_at, description: @project_organization_type.description, is_active: @project_organization_type.is_active, is_deleted: @project_organization_type.is_deleted, name: @project_organization_type.name }
    assert_redirected_to project_organization_type_path(assigns(:project_organization_type))
  end

  test "should destroy project_organization_type" do
    assert_difference('ProjectOrganizationType.count', -1) do
      delete :destroy, id: @project_organization_type
    end

    assert_redirected_to project_organization_types_path
  end
end

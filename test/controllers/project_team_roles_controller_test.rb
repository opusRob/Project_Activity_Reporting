require 'test_helper'

class ProjectTeamRolesControllerTest < ActionController::TestCase
  setup do
    @project_team_role = project_team_roles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_team_roles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_team_role" do
    assert_difference('ProjectTeamRole.count') do
      post :create, project_team_role: { deleted_at: @project_team_role.deleted_at, description: @project_team_role.description, is_active: @project_team_role.is_active, is_deleted: @project_team_role.is_deleted, name: @project_team_role.name, project_team: @project_team_role.project_team }
    end

    assert_redirected_to project_team_role_path(assigns(:project_team_role))
  end

  test "should show project_team_role" do
    get :show, id: @project_team_role
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_team_role
    assert_response :success
  end

  test "should update project_team_role" do
    patch :update, id: @project_team_role, project_team_role: { deleted_at: @project_team_role.deleted_at, description: @project_team_role.description, is_active: @project_team_role.is_active, is_deleted: @project_team_role.is_deleted, name: @project_team_role.name, project_team: @project_team_role.project_team }
    assert_redirected_to project_team_role_path(assigns(:project_team_role))
  end

  test "should destroy project_team_role" do
    assert_difference('ProjectTeamRole.count', -1) do
      delete :destroy, id: @project_team_role
    end

    assert_redirected_to project_team_roles_path
  end
end

require 'test_helper'

class ProjectTeamEmployeesControllerTest < ActionController::TestCase
  setup do
    @project_team_employee = project_team_employees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_team_employees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_team_employee" do
    assert_difference('ProjectTeamEmployee.count') do
      post :create, project_team_employee: { employee: @project_team_employee.employee, project: @project_team_employee.project, project_team_role: @project_team_employee.project_team_role }
    end

    assert_redirected_to project_team_employee_path(assigns(:project_team_employee))
  end

  test "should show project_team_employee" do
    get :show, id: @project_team_employee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_team_employee
    assert_response :success
  end

  test "should update project_team_employee" do
    patch :update, id: @project_team_employee, project_team_employee: { employee: @project_team_employee.employee, project: @project_team_employee.project, project_team_role: @project_team_employee.project_team_role }
    assert_redirected_to project_team_employee_path(assigns(:project_team_employee))
  end

  test "should destroy project_team_employee" do
    assert_difference('ProjectTeamEmployee.count', -1) do
      delete :destroy, id: @project_team_employee
    end

    assert_redirected_to project_team_employees_path
  end
end

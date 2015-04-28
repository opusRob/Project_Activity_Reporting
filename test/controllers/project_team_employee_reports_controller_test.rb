require 'test_helper'

class ProjectTeamEmployeeReportsControllerTest < ActionController::TestCase
  setup do
    @project_team_employee_report = project_team_employee_reports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_team_employee_reports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_team_employee_report" do
    assert_difference('ProjectTeamEmployeeReport.count') do
      post :create, project_team_employee_report: { employee_id: @project_team_employee_report.employee_id, employee_type: @project_team_employee_report.employee_type, end_date: @project_team_employee_report.end_date, name: @project_team_employee_report.name, project_id: @project_team_employee_report.project_id, project_team_id: @project_team_employee_report.project_team_id, project_team_role_id: @project_team_employee_report.project_team_role_id, project_team_role_type: @project_team_employee_report.project_team_role_type, project_team_type: @project_team_employee_report.project_team_type, project_type: @project_team_employee_report.project_type, report_status_id: @project_team_employee_report.report_status_id, start_date: @project_team_employee_report.start_date }
    end

    assert_redirected_to project_team_employee_report_path(assigns(:project_team_employee_report))
  end

  test "should show project_team_employee_report" do
    get :show, id: @project_team_employee_report
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_team_employee_report
    assert_response :success
  end

  test "should update project_team_employee_report" do
    patch :update, id: @project_team_employee_report, project_team_employee_report: { employee_id: @project_team_employee_report.employee_id, employee_type: @project_team_employee_report.employee_type, end_date: @project_team_employee_report.end_date, name: @project_team_employee_report.name, project_id: @project_team_employee_report.project_id, project_team_id: @project_team_employee_report.project_team_id, project_team_role_id: @project_team_employee_report.project_team_role_id, project_team_role_type: @project_team_employee_report.project_team_role_type, project_team_type: @project_team_employee_report.project_team_type, project_type: @project_team_employee_report.project_type, report_status_id: @project_team_employee_report.report_status_id, start_date: @project_team_employee_report.start_date }
    assert_redirected_to project_team_employee_report_path(assigns(:project_team_employee_report))
  end

  test "should destroy project_team_employee_report" do
    assert_difference('ProjectTeamEmployeeReport.count', -1) do
      delete :destroy, id: @project_team_employee_report
    end

    assert_redirected_to project_team_employee_reports_path
  end
end

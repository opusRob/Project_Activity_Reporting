require 'test_helper'

class ProjectTeamEmployeeReportTasksControllerTest < ActionController::TestCase
  setup do
    @project_team_employee_report_task = project_team_employee_report_tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_team_employee_report_tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_team_employee_report_task" do
    assert_difference('ProjectTeamEmployeeReportTask.count') do
      post :create, project_team_employee_report_task: { application_id: @project_team_employee_report_task.application_id, build_id: @project_team_employee_report_task.build_id, created_by: @project_team_employee_report_task.created_by, project_team_employee_report_id: @project_team_employee_report_task.project_team_employee_report_id, release_id: @project_team_employee_report_task.release_id, task_id: @project_team_employee_report_task.task_id, updated_by: @project_team_employee_report_task.updated_by, work_date: @project_team_employee_report_task.work_date, work_hours: @project_team_employee_report_task.work_hours }
    end

    assert_redirected_to project_team_employee_report_task_path(assigns(:project_team_employee_report_task))
  end

  test "should show project_team_employee_report_task" do
    get :show, id: @project_team_employee_report_task
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_team_employee_report_task
    assert_response :success
  end

  test "should update project_team_employee_report_task" do
    patch :update, id: @project_team_employee_report_task, project_team_employee_report_task: { application_id: @project_team_employee_report_task.application_id, build_id: @project_team_employee_report_task.build_id, created_by: @project_team_employee_report_task.created_by, project_team_employee_report_id: @project_team_employee_report_task.project_team_employee_report_id, release_id: @project_team_employee_report_task.release_id, task_id: @project_team_employee_report_task.task_id, updated_by: @project_team_employee_report_task.updated_by, work_date: @project_team_employee_report_task.work_date, work_hours: @project_team_employee_report_task.work_hours }
    assert_redirected_to project_team_employee_report_task_path(assigns(:project_team_employee_report_task))
  end

  test "should destroy project_team_employee_report_task" do
    assert_difference('ProjectTeamEmployeeReportTask.count', -1) do
      delete :destroy, id: @project_team_employee_report_task
    end

    assert_redirected_to project_team_employee_report_tasks_path
  end
end

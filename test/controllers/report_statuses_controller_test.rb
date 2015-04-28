require 'test_helper'

class ReportStatusesControllerTest < ActionController::TestCase
  setup do
    @report_status = report_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:report_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create report_status" do
    assert_difference('ReportStatus.count') do
      post :create, report_status: { deleted_at: @report_status.deleted_at, description: @report_status.description, is_active: @report_status.is_active, is_deleted: @report_status.is_deleted, is_editable: @report_status.is_editable, name: @report_status.name }
    end

    assert_redirected_to report_status_path(assigns(:report_status))
  end

  test "should show report_status" do
    get :show, id: @report_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @report_status
    assert_response :success
  end

  test "should update report_status" do
    patch :update, id: @report_status, report_status: { deleted_at: @report_status.deleted_at, description: @report_status.description, is_active: @report_status.is_active, is_deleted: @report_status.is_deleted, is_editable: @report_status.is_editable, name: @report_status.name }
    assert_redirected_to report_status_path(assigns(:report_status))
  end

  test "should destroy report_status" do
    assert_difference('ReportStatus.count', -1) do
      delete :destroy, id: @report_status
    end

    assert_redirected_to report_statuses_path
  end
end

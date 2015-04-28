require 'test_helper'

class ProjectOrganizationsControllerTest < ActionController::TestCase
  setup do
    @project_organization = project_organizations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_organizations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_organization" do
    assert_difference('ProjectOrganization.count') do
      post :create, project_organization: { organization_id: @project_organization.organization_id, organization_type: @project_organization.organization_type, project_id: @project_organization.project_id, project_organization_: @project_organization.project_organization_, project_type: @project_organization.project_type }
    end

    assert_redirected_to project_organization_path(assigns(:project_organization))
  end

  test "should show project_organization" do
    get :show, id: @project_organization
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_organization
    assert_response :success
  end

  test "should update project_organization" do
    patch :update, id: @project_organization, project_organization: { organization_id: @project_organization.organization_id, organization_type: @project_organization.organization_type, project_id: @project_organization.project_id, project_organization_: @project_organization.project_organization_, project_type: @project_organization.project_type }
    assert_redirected_to project_organization_path(assigns(:project_organization))
  end

  test "should destroy project_organization" do
    assert_difference('ProjectOrganization.count', -1) do
      delete :destroy, id: @project_organization
    end

    assert_redirected_to project_organizations_path
  end
end

class ProjectTeamEmployeeReportTask < ActiveRecord::Base
  belongs_to :project_team_employee_report
  belongs_to :task
  belongs_to :application
  belongs_to :release
  belongs_to :build
  belongs_to :created_by_user, :class_name => "User"
  belongs_to :updated_by_user, :class_name => "User"
end

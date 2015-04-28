class ProjectTeamEmployeeReport < ActiveRecord::Base
  belongs_to :employee, polymorphic: true
  belongs_to :project, polymorphic: true
  belongs_to :project_team, polymorphic: true
  belongs_to :project_team_role, polymorphic: true
  belongs_to :report_status
  has_many :tasks, through: :project_team_employee_report_tasks
end
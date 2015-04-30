class Build < ActiveRecord::Base
  has_many :project_team_employee_reports, through: :project_team_employee_report_tasks
  belongs_to :project
end
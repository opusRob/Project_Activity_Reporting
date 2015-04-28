class Task < ActiveRecord::Base
  belongs_to :task_type
  has_many :project_team_employee_reports, through: :project_team_employee_report_tasks
  belongs_to :created_by_user, :class_name => "User"
  belongs_to :updated_by_user, :class_name => "User"
end
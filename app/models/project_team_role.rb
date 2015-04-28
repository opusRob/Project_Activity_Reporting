class ProjectTeamRole < ActiveRecord::Base
	belongs_to :project_team
	has_many :project_team_employee_reports
  has_many :employees, through: :project_team_employees
end
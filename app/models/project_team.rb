class ProjectTeam < ActiveRecord::Base
	belongs_to :project
	has_many :project_team_employee_reports
	has_many :project_team_roles
	has_many :employees, through: :project_team_employees
end
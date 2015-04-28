class Project < ActiveRecord::Base
	has_many :organizations, through: :project_organizations
	has_many :project_teams
	has_many :project_team_employee_reports
end
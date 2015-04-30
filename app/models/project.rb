class Project < ActiveRecord::Base
	has_many :organizations, through: :project_organizations
	has_many :project_teams
	has_many :project_team_employee_reports
	has_many :tasks
	has_many :task_types
	has_many :report_statuses
	has_many :applications
	has_many :releases
	has_many :builds
end
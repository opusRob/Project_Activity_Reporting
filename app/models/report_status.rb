class ReportStatus < ActiveRecord::Base
	has_many :project_team_employee_reports
  belongs_to :project
end
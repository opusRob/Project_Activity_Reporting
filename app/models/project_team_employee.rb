class ProjectTeamEmployee < ActiveRecord::Base
	belongs_to :employee
	belongs_to :project_team
	belongs_to :project_team_role
end
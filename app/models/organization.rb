class Organization < ActiveRecord::Base
	has_many :employees
	has_many :project_organizations
	has_many :projects, through: :project_organizations, source: :organization, source_type: "Project"
end
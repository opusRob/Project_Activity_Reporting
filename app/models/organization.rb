class Organization < ActiveRecord::Base
	has_many :employees
	has_many :projects, through: :project_organizations
end
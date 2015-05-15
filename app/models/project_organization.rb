class ProjectOrganization < ActiveRecord::Base
  belongs_to :project, polymorphic: true
  belongs_to :organization, polymorphic: true
end
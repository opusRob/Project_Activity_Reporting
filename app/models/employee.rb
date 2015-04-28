class Employee < ActiveRecord::Base
  belongs_to :organization, polymorphic: true
  has_one :user
  has_many :project_team_employee_reports
  has_many :project_teams, through: :project_team_employees
  has_many :project_team_roles, through: :project_team_employees
end
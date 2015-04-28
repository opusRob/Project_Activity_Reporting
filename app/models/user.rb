class User < ActiveRecord::Base
	has_one :employee
	belongs_to :system_role
	has_many :created_by_project_team_employee_report_tasks, :foreign_key => "created_by_user_id"
	has_many :created_by_project_team_employee_report_tasks, :foreign_key => "updated_by_user_id"
	has_many :created_by_tasks, :foreign_key => "created_by_user_id"
	has_many :created_by_tasks, :foreign_key => "updated_by_user_id"
end
class Employer < ActiveRecord::Base
  has_many :users
  validates :name, presence: true
  # include Filterable
  # scope :contains, -> (name) { where("name like ?", "#{name}%") }
  # scope :is_active, -> (is_active) { where is_active: is_active }
  # scope :is_deleted, -> (is_deleted) { where is_deleted: is_deleted }
end

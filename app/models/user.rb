class User < ActiveRecord::Base
  belongs_to :employer
  belongs_to :role
end

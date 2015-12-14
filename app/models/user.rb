#
class User < ActiveRecord::Base
  include Authentication

  has_many :groceries
end

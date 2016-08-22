class Lunch < ActiveRecord::Base
  belongs_to :user
  belongs_to :lunchtable
end

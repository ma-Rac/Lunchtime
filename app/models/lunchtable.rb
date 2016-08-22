class Lunchtable < ActiveRecord::Base
  has_many :lunches, dependent: :destroy
  has_many :users, through: :lunches


  def update_val
    total = price.to_i * users.length.to_i
    self.update(total: total)
  end

end

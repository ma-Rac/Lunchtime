class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :name
  validates_uniqueness_of :name
  has_many :lunches
  has_many :lunchtables, through: :lunches

  def update_bal(cost, paid)
    new_balance = self.balance.to_f + paid.to_f - cost.to_f
    self.update(balance: new_balance)
  end


end

class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :balance, :decimal
    add_column :users, :name, :string
  end
end

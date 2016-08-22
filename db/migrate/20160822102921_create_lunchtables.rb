class CreateLunchtables < ActiveRecord::Migration
  def change
    create_table :lunchtables do |t|
      t.integer :price
      t.integer :total

      t.timestamps null: false
    end
  end
end

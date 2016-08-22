class CreateLunches < ActiveRecord::Migration
  def change
    create_table :lunches do |t|
      t.references :user, index: true, foreign_key: true
      t.references :lunchtable, index: true, foreign_key: true
      t.integer :paid

      t.timestamps null: false
    end
  end
end

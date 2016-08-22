class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.text :info

      t.timestamps null: false
    end
  end
end

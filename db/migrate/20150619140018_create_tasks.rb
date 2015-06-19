class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.date :due
      t.integer :list_id
      t.integer :order_number

      t.timestamps null: false
    end
  end
end

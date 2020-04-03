class CreateDishagrees < ActiveRecord::Migration[6.0]
  def change
    create_table :dishagrees do |t|
      t.integer :da_id
      t.integer :dfood_id

      t.timestamps
    end
  end
end

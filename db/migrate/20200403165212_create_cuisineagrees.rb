class CreateCuisineagrees < ActiveRecord::Migration[6.0]
  def change
    create_table :cuisineagrees do |t|
      t.integer :ca_id
      t.integer :cfood_id

      t.timestamps
    end
  end
end

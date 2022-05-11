class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :weight_in_grams
      t.integer :height_in_cm
      t.integer :width_in_cm
      t.integer :length_in_cm
      t.string :code

      t.timestamps
    end
  end
end

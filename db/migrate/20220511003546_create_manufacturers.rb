class CreateManufacturers < ActiveRecord::Migration[7.0]
  def change
    create_table :manufacturers do |t|
      t.string :tradename
      t.string :registered_name
      t.string :address
      t.string :email
      t.string :telephone
      t.integer :cnpj

      t.timestamps
    end
  end
end

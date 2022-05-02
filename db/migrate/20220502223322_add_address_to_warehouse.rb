class AddAddressToWarehouse < ActiveRecord::Migration[7.0]
  def change
    add_column :warehouses, :directions, :string
    add_column :warehouses, :cep, :string
    add_column :warehouses, :description, :string
  end
end

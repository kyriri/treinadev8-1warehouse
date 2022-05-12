class AddColumnManufacturerToProduct < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :manufacturer, null: false, foreign_key: true
  end
end

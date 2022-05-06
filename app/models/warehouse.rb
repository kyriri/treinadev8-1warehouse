class Warehouse < ApplicationRecord
  validates :name, :directions, :city, :state, :cep, :description,
            :area, :code, presence: true
  # validates :area, numericality: true
  # validates :code, length: { is: 3 }
end

class Warehouse < ApplicationRecord
  validates :name, :directions, :city, :state, :cep, :description,
            :area, :code, presence: true
  validates :code, uniqueness: true
  validates :code, length: { is: 3 }
  # validates :area, numericality: true
end

class Warehouse < ApplicationRecord
  validates :name, :directions, :city, :state, :cep, :description,
            :area, :code, presence: true
  validates :name, :code, uniqueness: true
  validates :code, length: { is: 3 }
  validates :cep, format: { with: /\A[0-9]{5}-[0-9]{3}\z/ }
end

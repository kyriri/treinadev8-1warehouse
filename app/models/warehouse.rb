class Warehouse < ApplicationRecord
  validates :name, :directions, :city, :state, :cep, :description,
            :area, :code, presence: true
  validates :code, uniqueness: true
  # validates :code, format: { with: /\A[a-zA-Z]+\z/, message: "only allows numbers and letters" }
  # validates :code, length: { is: 3 }
  # validates :area, numericality: true
end

class Manufacturer < ApplicationRecord
  validates :tradename, :registered_name, :email, :cnpj, presence: true
  validates :cnpj, length: { is: 13 }
end

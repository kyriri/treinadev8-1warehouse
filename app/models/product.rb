class Product < ApplicationRecord
  validates :name, :code, :weight_in_grams, :height_in_cm, :width_in_cm, 
                   :length_in_cm,  presence: true
  validates :code, length: { is: 20 }
  validates :code, uniqueness: true
  validates :weight_in_grams, :height_in_cm, :width_in_cm, 
                   :length_in_cm, comparison: { greater_than: 0 }

  belongs_to :manufacturer
end

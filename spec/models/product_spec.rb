require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#valid?' do
    context '(presence validation)' do
      it 'is false when name is blank' do
        product = Product.new(name: '', code: '12345678901234567890', 
                              weight_in_grams: 5000, height_in_cm: 150, 
                              width_in_cm: 120, length_in_cm: 200)
        
        expect(product.valid?).to be false
      end

      it 'is false when code is blank' do
        product = Product.new(name: 'Clearksy table', code: '', 
                              weight_in_grams: 5000, height_in_cm: 150, 
                              width_in_cm: 120, length_in_cm: 200)
        
        expect(product.valid?).to be false
      end

      it 'is false when weight is blank' do
        product = Product.new(name: 'Clearksy table', code: '12345678901234567890', 
                              weight_in_grams: '', height_in_cm: 150, 
                              width_in_cm: 120, length_in_cm: 200)
        
        expect(product.valid?).to be false
      end

      it 'is false when height is blank' do
        product = Product.new(name: 'Clearksy table', code: '12345678901234567890', 
                              weight_in_grams: 5000, height_in_cm: '', 
                              width_in_cm: 120, length_in_cm: 200)
        
        expect(product.valid?).to be false
      end

      it 'is false when width is blank' do
        product = Product.new(name: 'Clearksy table', code: '12345678901234567890', 
                              weight_in_grams: 5000, height_in_cm: 150, 
                              width_in_cm: '', length_in_cm: 200)
        
        expect(product.valid?).to be false
      end

      it 'is false when length is blank' do
        product = Product.new(name: 'Clearksy table', code: '12345678901234567890', 
                              weight_in_grams: 5000, height_in_cm: 150, 
                              width_in_cm: 120, length_in_cm: '')
        
        expect(product.valid?).to be false
      end
    end

    context '(length validation)' do
      it 'is false when code is not made of 20 chars' do
        product = Product.new(name: 'Clearksy table', code: 'A', 
                              weight_in_grams: 5000, height_in_cm: 150, 
                              width_in_cm: 120, length_in_cm: 200)
        
        expect(product.valid?).to be false
      end
    end

    context '(uniqueness validation)' do
      it 'is false when code was already in use' do
        Product.create!(name: 'Rainydayz bench', code: '12345678901234567890', 
                        weight_in_grams: 2000, height_in_cm: 150, 
                        width_in_cm: 120, length_in_cm: 200)
        product = Product.new(name: 'Clearksy table', code: '12345678901234567890', 
                              weight_in_grams: 5000, height_in_cm: 120, 
                              width_in_cm: 80, length_in_cm: 70)
        
        expect(product.valid?).to be false
      end
    end

    context '(positive number validation)' do
      it 'is false when weight is less than zero' do
        product = Product.new(name: 'Clearksy table', code: '12345678901234567890', 
                              weight_in_grams: -5000, height_in_cm: 120, 
                              width_in_cm: 80, length_in_cm: 70)
        
        expect(product.valid?).to be false
      end

      it 'is false when weight is zero' do
        product = Product.new(name: 'Clearksy table', code: '12345678901234567890', 
                              weight_in_grams: 0, height_in_cm: 120, 
                              width_in_cm: 80, length_in_cm: 70)
        
        expect(product.valid?).to be false
      end

      it 'is false when height is less than zero' do
        product = Product.new(name: 'Clearksy table', code: '12345678901234567890', 
                              weight_in_grams: 5000, height_in_cm: -120, 
                              width_in_cm: 80, length_in_cm: 70)
        
        expect(product.valid?).to be false
      end

      it 'is false when height is zero' do
        product = Product.new(name: 'Clearksy table', code: '12345678901234567890', 
                              weight_in_grams: 5000, height_in_cm: 0, 
                              width_in_cm: 80, length_in_cm: 70)
        
        expect(product.valid?).to be false
      end

      it 'is false when width is less than zero' do
        product = Product.new(name: 'Clearksy table', code: '12345678901234567890', 
                              weight_in_grams: 5000, height_in_cm: 120, 
                              width_in_cm: -80, length_in_cm: 70)
        
        expect(product.valid?).to be false
      end

      it 'is false when width is zero' do
        product = Product.new(name: 'Clearksy table', code: '12345678901234567890', 
                              weight_in_grams: 5000, height_in_cm: 120, 
                              width_in_cm: 0, length_in_cm: 70)
        
        expect(product.valid?).to be false
      end

      it 'is false when length is less than zero' do
        product = Product.new(name: 'Clearksy table', code: '12345678901234567890', 
                              weight_in_grams: 5000, height_in_cm: 120, 
                              width_in_cm: 80, length_in_cm: -70)
        
        expect(product.valid?).to be false
      end

      it 'is false when length is zero' do
        product = Product.new(name: 'Clearksy table', code: '12345678901234567890', 
                              weight_in_grams: 5000, height_in_cm: 120, 
                              width_in_cm: 80, length_in_cm: 0)
        
        expect(product.valid?).to be false
      end
    end
  end
end

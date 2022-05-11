require 'rails_helper'

RSpec.describe Manufacturer, type: :model do
  describe '#valid?' do
    context '(presence validation)' do
      it 'is false when tradename is blank' do
        manuf = Manufacturer.new(tradename: '',
                                registered_name: 'Pear do Brasil LTDA',
                                address: 'Av. Cooper Tinu, 3 - Manaus, AM',
                                email: 'comercial@pear.com.br',
                                telephone: '(92) 3026-8573',
                                cnpj: 1234567890123)
        
        expect(manuf.valid?).to be false
      end

      it 'is false when registered name is blank' do
        manuf = Manufacturer.new(tradename: 'Pear',
                                registered_name: '',
                                address: 'Av. Cooper Tinu, 3 - Manaus, AM',
                                email: 'comercial@pear.com.br',
                                telephone: '(92) 3026-8573',
                                cnpj: 1234567890123)
        
        expect(manuf.valid?).to be false
      end

      it 'is false when email is blank' do
        manuf = Manufacturer.new(tradename: 'Pear',
                                registered_name: 'Pear do Brasil LTDA',
                                address: 'Av. Cooper Tinu, 3 - Manaus, AM',
                                email: '',
                                telephone: '(92) 3026-8573',
                                cnpj: 1234567890123)
        
        expect(manuf.valid?).to be false
      end

      it 'is false when CNPJ is blank' do
        manuf = Manufacturer.new(tradename: 'Pear',
                                registered_name: 'Pear do Brasil LTDA',
                                address: 'Av. Cooper Tinu, 3 - Manaus, AM',
                                email: 'comercial@pear.com.br',
                                telephone: '(92) 3026-8573',
                                cnpj: '')
        
        expect(manuf.valid?).to be false
      end
    end

    context '(numericality validation)' do
      it 'is false when cnpj is not a number' do
        manuf = Manufacturer.new(tradename: '',
                                registered_name: 'Pear do Brasil LTDA',
                                address: 'Av. Cooper Tinu, 3 - Manaus, AM',
                                email: 'comercial@pear.com.br',
                                telephone: '(92) 3026-8573',
                                cnpj: '123km67890123')
        
        expect(manuf.valid?).to be false
      end
    end

    context '(length validation)' do
      it 'is false when cnpj is not made of 13 digits' do
        manuf = Manufacturer.new(tradename: 'Pear',
                                registered_name: 'Pear do Brasil LTDA',
                                address: 'Av. Cooper Tinu, 3 - Manaus, AM',
                                email: 'comercial@pear.com.br',
                                telephone: '(92) 3026-8573',
                                cnpj: 1234567890000000123)
        
        expect(manuf.valid?).to be false
      end
    end
  end
end

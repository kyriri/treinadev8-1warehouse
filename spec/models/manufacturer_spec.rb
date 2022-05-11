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
        manuf = Manufacturer.new(tradename: 'Pear',
                                registered_name: 'Pear do Brasil LTDA',
                                address: 'Av. Cooper Tinu, 3 - Manaus, AM',
                                email: 'comercial@pear.com.br',
                                telephone: '(92) 3026-8573',
                                cnpj: '123km67890123')
        
        expect(manuf.valid?).to be false
      end
    end

    context '(uniqueness validation)' do
      it 'is false when cnpj was already in use' do
        Manufacturer.create!(tradename: 'Pear',
                            registered_name: 'Pear do Brasil LTDA',
                            address: 'Av. Cooper Tinu, 3 - Manaus, AM',
                            email: 'comercial@pear.com.br',
                            telephone: '(92) 3026-8573',
                            cnpj: 1234567890123)
        manuf = Manufacturer.new(tradename: 'Pomme de terre',
                                registered_name: 'Patatis Brasilis Ltda',
                                address: 'Rodovia PR 354 km 12, Fritol',
                                email: 'contato@pdt.com.br',
                                telephone: '(45) 9 9656-0932',
                                cnpj: 1234567890123)
        
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

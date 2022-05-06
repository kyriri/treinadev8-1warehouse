require 'rails_helper'

RSpec.describe Warehouse, type: :model do
  describe '#valid?' do
    context '(presence validation)' do
      it 'is true when all fields are filled' do
        warehouse = Warehouse.create(name: 'Oompa Loompa', code: 'CHF', area: 1_000,
                                    directions: 'Av. Rocher, s/n',
                                    city: 'Chocolândia', state: 'SC',
                                    cep: '15520-000',
                                    description: 'Handles all chocolate products, including Easter eggs')
        
        response = warehouse.valid?

        expect(response).to eq true
      end

      it 'is false when name is blank' do
        warehouse = Warehouse.create(name: '', code: 'CHF', area: 1_000,
                                    directions: 'Av. Rocher, s/n',
                                    city: 'Chocolândia', state: 'SC',
                                    cep: '15520-000',
                                    description: 'Handles all chocolate products, including Easter eggs')
        
        response = warehouse.valid?

        expect(response).to eq false
      end

      it 'is false when code is blank' do
        warehouse = Warehouse.create(name: 'Oompa Loompa', code: '', area: 1_000,
                                    directions: 'Av. Rocher, s/n',
                                    city: 'Chocolândia', state: 'SC',
                                    cep: '15520-000',
                                    description: 'Handles all chocolate products, including Easter eggs')
        
        response = warehouse.valid?

        expect(response).to eq false
      end

      it 'is false when area is blank' do
        warehouse = Warehouse.create(name: 'Oompa Loompa', code: 'CHF', area: '',
                                    directions: 'Av. Rocher, s/n',
                                    city: 'Chocolândia', state: 'SC',
                                    cep: '15520-000',
                                    description: 'Handles all chocolate products, including Easter eggs')
        
        response = warehouse.valid?

        expect(response).to eq false
      end

      it 'is false when directions is blank' do
        warehouse = Warehouse.create(name: 'Oompa Loompa', code: 'CHF', area: 1_000,
                                    directions: '',
                                    city: 'Chocolândia', state: 'SC',
                                    cep: '15520-000',
                                    description: 'Handles all chocolate products, including Easter eggs')
        
        response = warehouse.valid?

        expect(response).to eq false
      end

      it 'is false when city is blank' do
        warehouse = Warehouse.create(name: 'Oompa Loompa', code: 'CHF', area: 1_000,
                                    directions: 'Av. Rocher, s/n',
                                    city: '', state: 'SC',
                                    cep: '15520-000',
                                    description: 'Handles all chocolate products, including Easter eggs')
        
        response = warehouse.valid?

        expect(response).to eq false
      end

      it 'is false when state is blank' do
        warehouse = Warehouse.create(name: 'Oompa Loompa', code: 'CHF', area: 1_000,
                                    directions: 'Av. Rocher, s/n',
                                    city: 'Chocolândia', state: '',
                                    cep: '15520-000',
                                    description: 'Handles all chocolate products, including Easter eggs')
        
        response = warehouse.valid?

        expect(response).to eq false
      end

      it 'is false when cep is blank' do
        warehouse = Warehouse.create(name: 'Oompa Loompa', code: 'CHF', area: 1_000,
                                    directions: 'Av. Rocher, s/n',
                                    city: 'Chocolândia', state: 'SC',
                                    cep: '',
                                    description: 'Handles all chocolate products, including Easter eggs')
        
        response = warehouse.valid?

        expect(response).to eq false
      end

      it 'is false when description is blank' do
        warehouse = Warehouse.create(name: 'Oompa Loompa', code: 'CHF', area: 1_000,
                                    directions: 'Av. Rocher, s/n',
                                    city: 'Chocolândia', state: 'SC',
                                    cep: '15520-000',
                                    description: '')
        
        response = warehouse.valid?

        expect(response).to eq false
      end
    end
  end
end

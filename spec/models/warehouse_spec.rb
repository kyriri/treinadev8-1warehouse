require 'rails_helper'

RSpec.describe Warehouse, type: :model do
  describe '#valid?' do
    context '(presence validation)' do
      it 'is true when all fields are filled' do
        warehouse = Warehouse.new(name: 'Oompa Loompa', code: 'CHF', area: 1_000,
                                    directions: 'Av. Rocher, s/n',
                                    city: 'Chocolândia', state: 'SC',
                                    cep: '15520-000',
                                    description: 'Handles all chocolate products, including Easter eggs')
        
        response = warehouse.valid?

        expect(response).to eq true
      end

      it 'is false when name is blank' do
        warehouse = Warehouse.new(name: '', code: 'CHF', area: 1_000,
                                    directions: 'Av. Rocher, s/n',
                                    city: 'Chocolândia', state: 'SC',
                                    cep: '15520-000',
                                    description: 'Handles all chocolate products, including Easter eggs')
        
        response = warehouse.valid?

        expect(response).to eq false
      end

      it 'is false when code is blank' do
        warehouse = Warehouse.new(name: 'Oompa Loompa', code: '', area: 1_000,
                                    directions: 'Av. Rocher, s/n',
                                    city: 'Chocolândia', state: 'SC',
                                    cep: '15520-000',
                                    description: 'Handles all chocolate products, including Easter eggs')
        
        response = warehouse.valid?

        expect(response).to eq false
      end

      it 'is false when area is blank' do
        warehouse = Warehouse.new(name: 'Oompa Loompa', code: 'CHF', area: '',
                                    directions: 'Av. Rocher, s/n',
                                    city: 'Chocolândia', state: 'SC',
                                    cep: '15520-000',
                                    description: 'Handles all chocolate products, including Easter eggs')
        
        response = warehouse.valid?

        expect(response).to eq false
      end

      it 'is false when directions is blank' do
        warehouse = Warehouse.new(name: 'Oompa Loompa', code: 'CHF', area: 1_000,
                                    directions: '',
                                    city: 'Chocolândia', state: 'SC',
                                    cep: '15520-000',
                                    description: 'Handles all chocolate products, including Easter eggs')
        
        response = warehouse.valid?

        expect(response).to eq false
      end

      it 'is false when city is blank' do
        warehouse = Warehouse.new(name: 'Oompa Loompa', code: 'CHF', area: 1_000,
                                    directions: 'Av. Rocher, s/n',
                                    city: '', state: 'SC',
                                    cep: '15520-000',
                                    description: 'Handles all chocolate products, including Easter eggs')
        
        response = warehouse.valid?

        expect(response).to eq false
      end

      it 'is false when state is blank' do
        warehouse = Warehouse.new(name: 'Oompa Loompa', code: 'CHF', area: 1_000,
                                    directions: 'Av. Rocher, s/n',
                                    city: 'Chocolândia', state: '',
                                    cep: '15520-000',
                                    description: 'Handles all chocolate products, including Easter eggs')
        
        response = warehouse.valid?

        expect(response).to eq false
      end

      it 'is false when cep is blank' do
        warehouse = Warehouse.new(name: 'Oompa Loompa', code: 'CHF', area: 1_000,
                                    directions: 'Av. Rocher, s/n',
                                    city: 'Chocolândia', state: 'SC',
                                    cep: '',
                                    description: 'Handles all chocolate products, including Easter eggs')
        
        response = warehouse.valid?

        expect(response).to eq false
      end

      it 'is false when description is blank' do
        warehouse = Warehouse.new(name: 'Oompa Loompa', code: 'CHF', area: 1_000,
                                    directions: 'Av. Rocher, s/n',
                                    city: 'Chocolândia', state: 'SC',
                                    cep: '15520-000',
                                    description: '')
        
        response = warehouse.valid?

        expect(response).to eq false
      end
    end

    context '(uniqueness validation)' do
      it 'is false when name was already in use' do
        Warehouse.create(name: 'Oompa Loompa', code: 'CHF', area: 1_000,
                        directions: 'Av. Rocher, s/n',
                        city: 'Chocolândia', state: 'SC',
                        cep: '15520-000',
                        description: 'Handles all chocolate products, including Easter eggs')
        warehouse = Warehouse.new(name: 'Oompa Loompa', code: 'FAB', area: 5_000,
                                  directions: 'Via Laktea, 35',
                                  city: 'Cacaulândia', state: 'PR',
                                  cep: '25045-989',
                                  description: 'Packages chocolate products.')
          
        expect(warehouse).not_to be_valid
      end

      it 'is false when code was already in use' do
        Warehouse.create(name: 'Oompa Loompa', code: 'CHF', area: 1_000,
                        directions: 'Av. Rocher, s/n',
                        city: 'Chocolândia', state: 'SC',
                        cep: '15520-000',
                        description: 'Handles all chocolate products, including Easter eggs')
        warehouse = Warehouse.new(name: 'Ninho', code: 'CHF', area: 5_000,
                                  directions: 'Via Laktea, 35',
                                  city: 'Cacaulândia', state: 'PR',
                                  cep: '25045-989',
                                  description: 'Packages chocolate products.')
          
        expect(warehouse).not_to be_valid
      end
    end

    context '(length validation)' do
      it 'is false when code is not 3 characters' do
        warehouse1 = Warehouse.new(name: 'Oompa Loompa', code: 'CHOF', area: 1_000,
                                  directions: 'Av. Rocher, s/n',
                                  city: 'Chocolândia', state: 'SC',
                                  cep: '15520-000',
                                  description: 'Handles all chocolate products, including Easter eggs')
        warehouse2 = Warehouse.new(name: 'Ninho', code: '45', area: 5_000,
                                  directions: 'Via Laktea, 35',
                                  city: 'Cacaulândia', state: 'PR',
                                  cep: '25045-989',
                                  description: 'Packages chocolate products.')
        
        expect(warehouse1).not_to be_valid
        expect(warehouse2).not_to be_valid
      end
    end

    context '(syntax validation)' do
      it 'is false when cep is not of type 00000-000' do
        warehouse1 = Warehouse.new(name: '.', code: 'MXP', area: 1, directions: '.', city: '.', state: '.',
                                  cep: '12345000', description: '.')
        warehouse2 = Warehouse.new(name: '.', code: 'MXP', area: 1, directions: '.', city: '.', state: '.',
                                  cep: 'nn345000', description: '.')
        warehouse3 = Warehouse.new(name: '.', code: 'MXP', area: 1, directions: '.', city: '.', state: '.',
                                  cep: '12-3451234', description: '.')
        
        expect(warehouse1).not_to be_valid
        expect(warehouse2).not_to be_valid
        expect(warehouse3).not_to be_valid
      end
    end
  end
end

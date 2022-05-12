require 'rails_helper'

describe 'User see list of products' do
  it 'succesfully' do
    manuf = Manufacturer.create!(tradename: 'Vesuvia', registered_name: 'Serralheria Vesuvia ME Ltda',
                                address: 'Estrada dos Pinhais, km 4, SC', email: 'livia@vesuvia.com.br',
                                telephone: '(49) 9 9450-9384', cnpj: 1234567890123)
    product = Product.create!(name: 'Clearksy table', code: '12345678901234567890', 
                              weight_in_grams: 5000, height_in_cm: 150, 
                              width_in_cm: 120, length_in_cm: 200, manufacturer: manuf)
    
    visit products_path

    expect(page).to have_content('Clearksy table')
    expect(page).to have_content('12345678901234567890')
    expect(page).to have_content('Vesuvia')
  end

  it 'but no products are registered' do
    visit products_path

    expect(page).to have_content('Não existem produtos cadastrados')
  end

  describe 'User sees products details ' do
    it 'succesfully' do
      manuf = Manufacturer.create!(tradename: 'Vesuvia', registered_name: 'Serralheria Vesuvia ME Ltda',
                                address: 'Estrada dos Pinhais, km 4, SC', email: 'livia@vesuvia.com.br',
                                telephone: '(49) 9 9450-9384', cnpj: 1234567890123)
      product = Product.create!(name: 'Clearksy table', code: '12345678901234567890', 
                                weight_in_grams: 5000, height_in_cm: 150, 
                                width_in_cm: 120, length_in_cm: 200, manufacturer: manuf)
      
      visit products_path
      click_on 'Clearksy table'

      expect(page).to have_content('Clearksy table')
      expect(page).to have_content('5.0 kg')
      expect(page).to have_content('150 cm')
      expect(page).to have_content('12345678901234567890')
      expect(page).to have_content('Vesuvia')
    end
  end
end
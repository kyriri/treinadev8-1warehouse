require 'rails_helper'

describe 'User visits Manufacturers page' do
  it 'and sees a list of them' do
    Manufacturer.create!(tradename: 'Pear',
                        registered_name: 'Pear do Brasil LTDA',
                        address: 'Av. Cooper Tinu, 3 - Manaus, AM',
                        email: 'comercial@pear.com.br',
                        telephone: '(92) 3026-8573',
                        cnpj: 1234567890123)
    Manufacturer.create!(tradename: 'Pomme de terre',
                        registered_name: 'Patatis Brasilis Ltda',
                        address: 'Rodovia PR 354 km 12, Fritol',
                        email: 'contato@pdt.com.br',
                        telephone: '(45) 9 9656-0932',
                        cnpj: 1234567890000)
  
    visit root_path
    click_on 'Fornecedores'

    expect(current_path).to eq(manufacturers_path)
    expect(page).to have_content('Pear')
    expect(page).to have_content('Pomme de terre')
  end

  it 'but there are none' do
    visit manufacturers_path

    expect(page).to have_content('Nenhum fornecedor cadastrado')
  end

end
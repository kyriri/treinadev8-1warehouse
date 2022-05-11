require 'rails_helper'

describe 'User tries to register manufacturer' do
  it 'and is succesful' do
    visit manufacturers_path
    click_on 'Cadastrar novo fornecedor'

    fill_in 'Nome fantasia', with: 'Pear'
    fill_in 'Razão social', with: 'Pear do Brasil Ltda'
    fill_in 'CNPJ', with: '1234567000133'
    fill_in 'Endereço', with: 'Av. Cooper Tchinu, 3 - Manaus, AM'
    fill_in 'E-mail', with: 'comercial@pear.com.br'
    fill_in 'Telefone', with: '(92) 3026-8573'
    click_on 'Cadastrar fornecedor'

    expect(Manufacturer.last.tradename).to eq('Pear')
    expect(page).not_to have_text('Houve um erro. O fornecedor não foi cadastrado.')
    expect(page).to have_text('Fornecedor Pear cadastrado com sucesso')
    expect(current_path).to eq(new_manufacturer_path)
    expect(page).to have_css('form')
  end

  it 'but input is unacceptable' do
    Manufacturer.create!(tradename: 'Pomme de terre',
                        registered_name: 'Patatis Brasilis Ltda',
                        address: 'Rodovia PR 354 km 12, Fritol',
                        email: 'contato@pdt.com.br',
                        telephone: '(45) 9 9656-0932',
                        cnpj: 1234567890000)
    
    visit new_manufacturer_path
    fill_in 'Nome fantasia', with: ''
    fill_in 'Razão social', with: ''
    fill_in 'CNPJ', with: '1234567890000'
    click_on 'Cadastrar fornecedor'

    expect(page).to have_text('Nome fantasia não pode ficar em branco')
    expect(page).to have_text('Razão social não pode ficar em branco')
    expect(page).to have_text('E-mail não pode ficar em branco')
    expect(page).to have_text('CNPJ já está em uso')
  end
end
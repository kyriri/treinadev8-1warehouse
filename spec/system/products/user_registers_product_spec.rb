require 'rails_helper'

describe 'User tries to register a product' do
  it 'and is succesful' do
    Manufacturer.create!(tradename: 'Vesuvia', registered_name: 'Serralheria Vesuvia ME Ltda',
                          address: 'Estrada dos Pinhais, km 4, SC', email: 'livia@vesuvia.com.br',
                          telephone: '(49) 9 9450-9384', cnpj: 1234567890123)
    Manufacturer.create!(tradename: 'Pomme de terre', registered_name: 'Patatis Brasilis Ltda',
                          address: 'Rodovia PR 354 km 12, Fritol', email: 'contato@pdt.com.br',
                          telephone: '(45) 9 9656-0932', cnpj: 1234567890000)

    visit products_path
    click_on 'Registrar novo produto'
    fill_in 'Nome', with: 'Poltrona Netflix Binge'
    fill_in 'Código', with: '12345678901234567890'
    page.select 'Vesuvia', from: 'Fornecedor'
    fill_in 'Peso', with: '10_500'
    fill_in 'Altura', with: '120'
    fill_in 'Largura', with: '80'
    fill_in 'Comprimento', with: '90'
    click_on 'Cadastrar produto'

    expect(page).to have_text('Produto cadastrado com sucesso')
    expect(page).not_to have_text('Houve um erro. O produto não foi cadastrado.')
    expect(page).to have_text('Vesuvia')
    expect(page).to have_text('10.5 kg')
    expect(page).to have_text('80 cm')
    expect(current_path).to eq(product_path(Product.last.id))
  end

  it 'and receives error message if mandatory field is missing' do
    Manufacturer.create!(tradename: 'Vesuvia', registered_name: 'Serralheria Vesuvia ME Ltda',
                          address: 'Estrada dos Pinhais, km 4, SC', email: 'livia@vesuvia.com.br',
                          telephone: '(49) 9 9450-9384', cnpj: 1234567890123)
    Manufacturer.create!(tradename: 'Pomme de terre', registered_name: 'Patatis Brasilis Ltda',
                          address: 'Rodovia PR 354 km 12, Fritol', email: 'contato@pdt.com.br',
                          telephone: '(45) 9 9656-0932', cnpj: 1234567890000)

    visit new_product_path
    fill_in 'Nome', with: 'Poltrona Netflix Binge'
    fill_in 'Comprimento', with: ''
    click_on 'Cadastrar produto'

    expect(page).not_to have_text('Produto cadastrado com sucesso')
    expect(page).to have_text('Houve um erro. O produto não foi cadastrado.')
    expect(page).to have_text('não pode ficar em branco')
    expect(page).to have_css('form')
    expect(page).to have_field('Nome', with: 'Poltrona Netflix Binge')
  end
end


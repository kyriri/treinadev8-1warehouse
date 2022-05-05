require 'rails_helper'

describe 'User tries to register a new warehouse' do
  it 'succesfully' do

  visit root_path
  click_on 'Cadastrar novo galpão'
  fill_in 'Nome', with: 'Belém'
  fill_in 'Código', with: 'BEL'
  fill_in 'Área', with: 10_000
  fill_in 'Linha 1', with: "Caminho do Mar, 950 - perto do posto Piranga'y"
  fill_in 'Cidade', with: 'Ananindeua'
  fill_in 'Estado', with: 'PA'
  fill_in 'CEP', with: '67140-000'
  fill_in 'Descrição', with: 'Handles deliveries for PA and MA.'
  click_on 'Salvar'

  expect(current_path).to eq(new_warehouse_path)
  expect(page).to have_text("Galpão BEL salvo com sucesso")
  expect(Warehouse.last.name).to eq('Belém')
  end

  xit 'but something goes wrong' do
    visit new_warehouse_path
    click_on 'Salvar'

    expect(page).to have_text('Houve um problema. O galpão não foi salvo.')

    expect(page).to have_text()
  end

  xit 'but some fields are missing' do
  end
end
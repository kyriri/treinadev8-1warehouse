require 'rails_helper'

describe 'User tries to register a new warehouse' do
  it 'and is succesful' do

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
  click_on 'Registrar Galpão'

  expect(current_path).to eq(new_warehouse_path)
  expect(page).to have_text("Galpão BEL salvo com sucesso")
  expect(Warehouse.last.name).to eq('Belém')
  end

  it 'but not all fields are filled' do
    visit new_warehouse_path
    fill_in 'Nome', with: ''
    click_on 'Registrar Galpão'

    expect(page).to have_text('Houve um problema. O galpão não foi salvo.')
    expect(page).not_to have_text('salvo com sucesso')
    expect(page).to have_text('Nome não pode ficar em branco').once
    expect(page).to have_text('não pode ficar em branco').exactly(8)
  end

  it "but they put a CEP in a wrong format" do

    visit new_warehouse_path
    fill_in 'Nome', with: 'Belém'
    fill_in 'Código', with: 'BEL'
    fill_in 'Área', with: 10_000
    fill_in 'Linha 1', with: "Caminho do Mar, 950 - perto do posto Piranga'y"
    fill_in 'Cidade', with: 'Ananindeua'
    fill_in 'Estado', with: 'PA'
    fill_in 'CEP', with: '6714-0000'
    fill_in 'Descrição', with: 'Handles deliveries for PA and MA.'
    click_on 'Registrar Galpão'

    expect(page).to have_text('Houve um problema. O galpão não foi salvo.')
    expect(page).not_to have_text('salvo com sucesso')
    expect(page).to have_text('CEP deve ter formato 00000-000').once
  end
end
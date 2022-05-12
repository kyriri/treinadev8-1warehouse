require 'rails_helper'

describe 'User tries to update a warehouse' do
  it 'and is succesful' do
    warehouse = Warehouse.create!(name: 'Zona Oeste', code: 'SPO', area: 50_000,
                                  directions: 'Av. Continental, 4.500',
                                  city: 'Diadema',
                                  cep: '05520-000',
                                  state: 'SP',
                                  description: 'Main packaging plant')
    
    visit warehouse_path(warehouse.id)
    click_on 'Editar galpão'
    fill_in 'Cidade', with: 'Osasco'
    click_on 'Atualizar Galpão'

    expect(current_path).to eq warehouse_path(warehouse.id)
    expect(page).to have_text('Galpão atualizado com sucesso')
    expect(page).to have_text('Osasco')
    expect(page).not_to have_text('Diadema')
  end

  it 'but they submit invalid entries' do
    Warehouse.create!(name: 'Zona Sul', code: 'SPS', area: 70_000,
                      directions: 'Av. Interlagos, 2.432',
                      city: 'São Paulo',
                      cep: '05670-000',
                      state: 'SP',
                      description: 'Stocks home appliances')
    warehouse = Warehouse.create!(name: 'Zona Oeste', code: 'SPO', area: 50_000,
                                  directions: 'Av. Continental, 4.500',
                                  city: 'Diadema',
                                  cep: '05520-000',
                                  state: 'SP',
                                  description: 'Main packaging plant')
    
    visit warehouse_path(warehouse.id)
    click_on 'Editar galpão'
    fill_in 'Nome', with: 'Zona Sul'
    fill_in 'Código', with: 'SPS'
    fill_in 'Cidade', with: ''
    click_on 'Atualizar Galpão'

    expect(page).to have_css('form')
    expect(page).to have_field('Cidade', with: '')
    expect(page).to have_field('Área', with: 50_000)
    expect(page).to have_text('Houve um problema. O galpão não foi salvo.')
    expect(page).to have_text('Nome já está em uso')
    expect(page).to have_text('Código já está em uso')
    expect(page).to have_text('Cidade não pode ficar em branco')
  end
end
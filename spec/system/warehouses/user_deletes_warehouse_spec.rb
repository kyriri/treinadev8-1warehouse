require 'rails_helper'

describe 'User tries to delete a warehouse' do
  it 'and it works' do
    Warehouse.create!(name: 'Belém', code: 'BEL', area: 10_000,
                      directions: "Caminho do Mar, 950 - perto do posto Piranga'y",
                      city: 'Ananindeua',
                      cep: '67140-000',
                      state: 'PA',
                      description: 'Handles deliveries for PA and MA.')
    warehouse = Warehouse.create!(name: 'Zona Oeste', code: 'SPO', area: 50_000,
                                  directions: 'Av. Continental, 4.500',
                                  city: 'Diadema',
                                  cep: '05520-000',
                                  state: 'SP',
                                  description: 'Main packaging plant')
    
    visit warehouse_path(warehouse.id)
    click_on 'Apagar galpão'

    expect(current_path).to eq(root_path)
    expect(page).to have_text('Galpão apagado com sucesso')
    expect(page).not_to have_text('SPO')
    expect(page).to have_text('Belém')
    expect(page).to have_text('BEL')
    expect(Warehouse.count).to equal(1)
  end
end
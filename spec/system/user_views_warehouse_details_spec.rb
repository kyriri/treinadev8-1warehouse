require 'rails_helper'

describe 'User visits warehouse details page' do
  it 'succesfully' do
    pa = Warehouse.create!(name: 'Belém', code: 'BEL', area: 10_000,
                          directions: "Caminho do Mar, 950 - perto do posto Piranga'y",
                          city: 'Ananindeua',
                          cep: '67140-000',
                          state: 'PA',
                          description: 'Handles deliveries for PA and MA.')
    
    visit root_path
    click_on 'Belém'

    expect(page).to have_content('Belém')
    expect(page).to have_content('BEL')
    expect(page).to have_content('10000 m²')
    expect(page).to have_content("Caminho do Mar, 950 - perto do posto Piranga'y")
    expect(page).to have_content('Ananindeua, PA')
    expect(page).to have_content('67140-000')
    expect(page).to have_content('Handles deliveries for PA and MA.')
  end

  it 'and goes back to homepage' do
    pa = Warehouse.create!(name: 'Belém', code: 'BEL', area: 10_000,
                          directions: "Caminho do Mar, 950 - perto do posto Piranga'y",
                          city: 'Ananindeua',
                          cep: '67140-000',
                          state: 'PA',
                          description: 'Handles deliveries for PA and MA.')

    visit warehouse_path(pa.id)
    click_on 'Voltar'
    
    expect(current_path).to eq('/')
  end
end
require 'rails_helper'

describe 'User visits homepage' do
  it 'and see app name' do
    visit('/')

    expect(page).to have_content('Galpões & Estoque')
  end

  it 'and see warehouses' do
    Warehouse.create!(name: 'Belém', code: 'BEL', area: 10_000,
                      directions: "Caminho do Mar, 950 - perto do posto Piranga'y",
                      city: 'Ananindeua',
                      cep: '67140-000',
                      state: 'PA',
                      description: 'Handles deliveries for PA and MA.')
    Warehouse.create!(name: 'São Paulo', code: 'SAO', area: 50_000,
                      directions: 'Av. Continental, 4.500',
                      city: 'Osasco',
                      cep: '05520-000',
                      state: 'SP',
                      description: 'Main packaging plant')

    visit('/')

    expect(page).not_to have_content('Nenhum galpão cadastrado.')
    expect(page).to have_content('Belém')
    expect(page).to have_content('BEL')
    expect(page).to have_content('Osasco - SP')
    expect(page).to have_content('50000 m²')
  end

  it 'and there are no warehouses to display' do
    visit root_path

    expect(page).to have_content('Nenhum galpão cadastrado.')
  end

  it 'from any other page in the application' do
    visit new_warehouse_path
    click_on 'Galpões & Estoque'

    expect(current_path).to eq('/')
  end
end


require 'rails_helper'

describe 'User visits homepage' do
  it 'and see app name' do
    visit('/')

    expect(page).to have_content('Galpões & Estoque')
  end

  it 'and see warehouses' do
    Warehouse.create!(name: 'Belém', code: 'BEL', city: 'Ananindeua', state: 'PA', area: 10_000)
    Warehouse.create!(name: 'São Paulo', code: 'SAO', city: 'Osasco', state: 'SP', area: 50_000)

    visit('/')

    expect(page).not_to have_content('Nenhum galpão cadastrado.')
    expect(page).to have_content('Belém')
    expect(page).to have_content('BEL')
    expect(page).to have_content('Osasco - SP')
    expect(page).to have_content('50000 m²')
  end

  it 'and there are no warehouses to display' do
    visit('/')

    expect(page).to have_content('Nenhum galpão cadastrado.')
  end
end


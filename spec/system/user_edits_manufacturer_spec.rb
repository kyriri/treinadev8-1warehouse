require 'rails_helper'

describe 'User tries to update Manufacturer data' do
  it 'and it works' do
    manuf = Manufacturer.create!(tradename: 'Pomme de terre',
                                registered_name: 'Patatis Brasilis Ltda',
                                address: 'Rodovia PR 354 km 12, Fritol',
                                email: 'contato@pdt.com.br',
                                telephone: '(45) 9 9656-0932',
                                cnpj: 1234567890000)
    
    visit manufacturers_path
    click_on 'Pomme de terre'
    click_on 'Atualizar dados'
    fill_in 'Razão social', with: 'PDT Brasil LTDA'
    click_on 'Salvar'
      
    expect(current_path).to eq(manufacturer_path(manuf.id))
    expect(page).to have_text('Dados atualizados com sucesso')
    expect(page).not_to have_text('Houve um erro. Os dados não foram atualizados.')
    expect(page).to have_text('PDT Brasil LTDA')
  end

  it 'but input is unacceptable' do
    manuf = Manufacturer.create!(tradename: 'Pomme de terre',
                                registered_name: 'Patatis Brasilis Ltda',
                                address: 'Rodovia PR 354 km 12, Fritol',
                                email: 'contato@pdt.com.br',
                                telephone: '(45) 9 9656-0932',
                                cnpj: 1234567890000)
    
    visit manufacturers_path
    click_on 'Pomme de terre'
    click_on 'Atualizar dados'
    fill_in 'CNPJ', with: '1'
    click_on 'Salvar'
      
    expect(page).to have_css('form')
    expect(page).not_to have_text('Dados atualizados com sucesso')
    expect(page).to have_text('Houve um erro. Os dados não foram atualizados.')
    expect(page).to have_text('CNPJ não possui o tamanho esperado')
    expect(page).to have_field('Razão social', with: 'Patatis Brasilis Ltda')
  end
end
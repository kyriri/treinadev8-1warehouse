require 'rails_helper'

describe 'User requests page' do
  it 'and by default it is in Portuguese' do
    visit root_path

    expect(page).to have_css('nav', text: 'Galpões')
  end

  it 'in Portuguese and sees it in Portuguese' do
    visit '/?locale=pt'

    expect(page).to have_css('nav', text: 'Galpões')
  end

  it 'in English and sees it in English' do
    visit '/?locale=en '

    expect(page).to have_css('nav', text: 'Warehouses')
  end

  xit 'in an unsuported language and sees it in English' do
    visit '/?locale=th'

    expect(page).to have_css('nav', text: 'Warehouses')
    expect(page).to have_text('Unsuported language. You were redirected to the English version')
  end
end
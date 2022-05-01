require 'rails_helper'

describe 'User visits homepage' do
  it 'and see app name' do
    visit('/')
    expect(page).to have_content('Galpões & Estoque')
  end
end


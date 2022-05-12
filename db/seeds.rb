# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Warehouse.destroy_all
Product.destroy_all
Manufacturer.destroy_all

Warehouse.create!([{name: 'Belém', 
                    code: 'BEL', 
                    area: 10_000,
                    directions: "Caminho do Mar, 950 - perto do posto Piranga'y",
                    city: 'Ananindeua',
                    state: 'PA', 
                    cep: '67140-000',
                    description: 'Handles deliveries for PA and MA.',
                  }, {
                    name: 'São Paulo', 
                    code: 'SAO', 
                    area: 50_000,
                    directions: "Rua dos Automobilistas, s/n",
                    city: 'Osasco', 
                    state: 'SP', 
                    cep: '06215-040',
                    description: 'Main packaging facility, and deliveries to West of São Paulo.',
                  }])

Manufacturer.create!([{tradename: 'Vesuvia', 
                      registered_name: 'Serralheria Vesuvia ME Ltda',
                      address: 'Estrada dos Pinhais, km 4, SC', 
                      email: 'livia@vesuvia.com.br',
                      telephone: '(49) 9 9450-9384', 
                      cnpj: 1234567890123,
                    }, {
                      tradename: 'Pomme de terre',
                      registered_name: 'Patatis Brasilis Ltda',
                      address: 'Rodovia PR 354 km 12, Fritol',
                      email: 'contato@pdt.com.br',
                      telephone: '(45) 9 9656-0932',
                      cnpj: 1234567890000,
                    }])

Product.create!([{name: 'Clearksy table', 
                  code: '12345678901234567890', 
                  weight_in_grams: 5000, 
                  height_in_cm: 150, 
                  width_in_cm: 120, 
                  length_in_cm: 200, 
                  manufacturer: Manufacturer.first,
                }, {
                  name: 'Rainydayz bench', 
                  code: '12345678901234567899', 
                  weight_in_grams: 2000, 
                  height_in_cm: 150, 
                  width_in_cm: 120, 
                  length_in_cm: 200, 
                  manufacturer: Manufacturer.first,
                }])

p "Created #{Warehouse.count} warehouse(s)"
p "Created #{Manufacturer.count} manufacturer(s)"
p "Created #{Product.count} product(s)"
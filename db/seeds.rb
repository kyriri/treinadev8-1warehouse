# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Warehouse.destroy_all

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

p "Created #{Warehouse.count} warehouse(s)"
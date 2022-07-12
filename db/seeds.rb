# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Strain.destroy_all

cepas = [
    { name: 'Carmenere', origin: 'Colchagua' },
    { name: 'Pais', origin: 'Colchagua' },
    { name: 'Cabernet', origin: 'Cachapoal' }
]

cepas.each do |cepa|
    strain = Strain.create(name: cepa[:name], origin: cepa[:origin])
    puts "Cepa: #{strain.name}"
end
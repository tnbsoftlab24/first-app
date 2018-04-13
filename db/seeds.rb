# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Product.destroy_all

listproduct = [
    ["Red bull","boisson energetique",17/03/2018 ],
    ["Addidas","Chaussures Addidas",07/02/2018 ],
    ["Black Panthers","Films d'action",01/01/2018 ],
    ["Infinix Hot X","Telephone  Android",05/04/2018]
]

listproduct.each do |name,description,date|
    Product.create(name: name, description: description,date: date)
end
 

p "Created #{Product.count} products"


# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

puts "Cleaning DB..."
Review.destroy_all
Restaurant.destroy_all

puts "Creating restaurants..."

restaurants = [
  { name: "La Tour d'Argent", address: "15 Quai de la Tournelle, 75005 Paris", phone_number: "01 43 54 23 31", category: "french" },
  { name: "Napolitana", address: "189 Rue Dante, Montréal, QC H2S 1K1", phone_number: "514 495-0079", category: "italian" },
  { name: "L'EXPRESS", address: "3927 RUE SAINT-DENIS,MONTRÉAL, QC", phone_number: "514 845-5333", category: "french" },
  { name: "Le Fameux", address: "4500 Rue Saint-Denis, Montreal, QC", phone_number: "514 845-8732", category: "french" },
  { name: "Los 3 Amigos", address: "4500 Rue Saint-Denis, Montreal, QC", phone_number: "514 845-8732", category: "french" }
]

restaurants.each do |attrs|
  restaurant = Restaurant.create!(attrs)
  3.times do
    restaurant.reviews.create!(rating: rand(1..5), content: "Tasty and friendly!")
  end
end

puts "Created #{Restaurant.count} restaurants with #{Review.count} reviews."
puts "Finished!"

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Product.delete_all

products =
  [
    {
      title: "2.05 Carat Round Ruby",
      description: "A stunning 2.05-carat round ruby with brilliant red hues, perfect for timeless elegance.",
      image_url: "ruby.png",
      price: 90991
    },
    {
      title: "1.04 Carat Round Diamond",
      description: "An exquisite 1.04-carat round diamond offering unmatched brilliance and sophistication.",
      image_url: "diamond.png",
      price: 383997
    },
    {
      title: "1.5 Carat Emerald Cut Emerald",
      description: "A 1.5-carat emerald cut emerald showcasing a vivid green color and exceptional clarity.",
      image_url: "emerald.png",
      price: 158597
    },
    {
      title: "1.07 Carat Round Blue Sapphire",
      description: "A 1.07-carat round blue sapphire with deep, enchanting blue tones.",
      image_url: "sapphire.png",
      price: 203391
    },
    {
      title: "1.5 Carat Round Amethyst",
      description: "A 1.5-carat round amethyst featuring a captivating purple hue and unique charm.",
      image_url: "amethyst.png",
      price: 15095
    },
    {
      title: "1.2 Carat Marquise Aquamarine",
      description: "A 1.2-carat marquise aquamarine with serene blue shades, embodying elegance.",
      image_url: "aquamarine.png",
      price: 59091
    },
    {
    title: "2.05 Carat White Opal",
      description: "A 2.05-carat white opal displaying an ethereal play of colors and a radiant finish.",
      image_url: "opal.png",
      price: 24995
    },
    {
    title: "1.3 Carat Round Topaz",
      description: "A 1.3-carat round topaz with a sparkling brilliance and timeless appeal.",
      image_url: "topaz.png",
      price: 23197
    },
    {
      title: "2.5 Carat Round Pink Sapphire",
      description: "A remarkable 2.5-carat round pink sapphire radiating vibrant pink tones and sophistication.",
      image_url: "pink_sapphire.png",
      price: 407897
    }
  ]

products.each do |product|
  product[:status] = "available"
  product[:secret] = "false"
  Product.create!(product)
end

Product.create!(
  title: "Narya",
  description: "Ring of Fire.",
  image_url: "narya.jpg",
  price: 999999999,
  secret: true
)

# db/seeds.rb

users = [
  { email: 'jane.doe@example.com', password: 'Password123', firstname: 'Jane', lastname: 'Doe' },
  { email: 'john.smith@example.com', password: 'Password123', firstname: 'John', lastname: 'Smith' },
  { email: 'susan.lee@example.com', password: 'Password123', firstname: 'Susan', lastname: 'Lee' },
  { email: 'michael.jones@example.com', password: 'Password123', firstname: 'Michael', lastname: 'Jones' },
  { email: 'emily.brown@example.com', password: 'Password123', firstname: 'Emily', lastname: 'Brown' }
]

users.each do |user|
  User.create!(user)
end

reviews_data = [
  { rating: 5, body: "I just received my diamond and it's breathtaking! The quality is unmatched and it's an investment I'll cherish forever. Definitely worth every penny!" },
  { rating: 4, body: "The ruby I bought is an absolute masterpiece. Stunning brilliance and clarity. It truly exceeds expectations in every way." },
  { rating: 1, body: "My experience with this emerald has been disappointing. The color isn't as vibrant as I expected, and the clarity is lacking. I regret my purchase." },
  { rating: 2, body: "I am not entirely happy with my sapphire. While the cut is good, the color is underwhelming compared to what I had hoped for." },
  { rating: 5, body: "I’ve never owned an opal before. It's stunning, well-crafted, and has an elegance to it that's hard to match. A true gem!" }
]

# Assign each review to a user
users = User.all
reviews_data.each_with_index do |review_data, index|
  user = users[index] # Get the user for the review
  user.reviews.create!(review_data) # Create the review and associate it with the user
end

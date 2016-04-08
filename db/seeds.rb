User.delete_all
Restaurant.delete_all
Review.delete_all

users = 20.times.map do
  User.create!(
                :email      => Faker::Internet.email,
                :password   => 'pass' )
end

restaurant = 20.times.map do
  Restaurant.create!(
    :creator_id => rand(1..20),
    :name => Faker::Company.name,
    :cuisine => Faker::Lorem.word,
    :address => Faker::Address.street_address,
    :city => Faker::Address.city,
    :state => Faker::Address.state_abbr,
    :zip => Faker::Address.zip )
end

review = 40.times.map do
  Review.create!(
    :user_id => rand(1..20),
    :restaurant_id => rand(1..20),
    :rating => rand(1..5),
    :review => Faker::Lorem.paragraph )
end
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Rails.logger = Logger.new(STDOUT)

number_of_records = 50

Rails.logger.info "Creating actors"
actors = Array.new(number_of_records) do
  Actor.create(name: Faker::Name.name)
end

Rails.logger.info "Creating directors"
directors = Array.new(number_of_records) do
  Director.create(name: Faker::Name.name)
end

Rails.logger.info "Creating countries"
countries = Array.new(number_of_records) do
  Country.create(name: Faker::Address.country)
end

Rails.logger.info "Creating locations"
locations = Array.new(number_of_records) do
  Location.create(name: Faker::Address.city)
end

Rails.logger.info "Creating reviews"
Array.new(number_of_records) do
  Review.create(
    user: Faker::Name.name,
    stars: Faker::Number.between(from: 1, to: 5),
    review: Faker::Lorem.paragraph
  )
end

Rails.logger.info "Creating movies"
Array.new(number_of_records) do
  movie = Movie.create(
    title: Faker::Movie.title,
    year: Faker::Number.between(from: 1900, to: 2022),
    description: Faker::Movie.quote
  )
  movie.actors << actors.sample
  movie.directors << directors.sample(Random.rand(1..3))
  movie.countries << countries.sample(Random.rand(1..3))
  movie.locations << locations.sample(Random.rand(1..3))
  movie.reviews << Review.all.sample(Random.rand(1..3))
end

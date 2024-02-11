require "csv"

namespace :movies do
  desc "Import movies from a CSV file"
  task import: :environment do
    puts "Importing movies from CSV file..."
    csv_file_name = ENV["CSV_FILE_NAME"] ||= "movies.csv"
    csv_text = File.read(Rails.root.join("db/imports/#{csv_file_name}").to_s)
    csv = CSV.parse(csv_text, headers: true, encoding: "ISO-8859-1")

    puts "Importing movies from CSV file #{csv_file_name}..."

    movies = {}
    actors = {}
    directors = {}
    locations = {}
    countries = {}

    csv.each do |row|
      puts "Importing movie: #{row["Movie"]}"
      movies[row["Movie"]] ||= Movie.new(title: row["Movie"], year: row["Year"], description: row["Description"])
      movie = movies[row["Movie"]]

      puts "Importing actors: #{row["Actor"]}"
      actors[row["Actor"]] ||= Actor.find_or_initialize_by(name: row["Actor"])
      puts "Importing directors: #{row["Director"]}"
      directors[row["Director"]] ||= Director.find_or_initialize_by(name: row["Director"])
      puts "Importing locations: #{row["Location"]}"
      locations[row["Filming location"]] ||= Location.find_or_initialize_by(name: row["Filming location"])
      puts "Importing countries: #{row["Country"]}"
      countries[row["Country"]] ||= Country.find_or_initialize_by(name: row["Country"])

      movie.actors << actors[row["Actor"]] if movie.actors.exclude?(actors[row["Actor"]])
      movie.directors << directors[row["Director"]] if movie.directors.exclude?(directors[row["Director"]])
      movie.locations << locations[row["Filming location"]] if movie.locations.exclude?(locations[row["Filming location"]])
      movie.countries << countries[row["Country"]] if movie.countries.exclude?(countries[row["Country"]])
    end

    movies.each_value do |movie|
      puts "Saving movie: #{movie.title}"
      movie.save!
      puts "Saved movie: #{movie.title}"
    rescue => e
      puts "Error: #{e.message} trying to save #{movie.title}"
    end
  rescue => e
    puts "Error: #{e.message}"
  end
end

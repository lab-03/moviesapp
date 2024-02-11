require "csv"
namespace :reviews do
  desc "Import reviews from a CSV file"
  task import: :environment do
    puts "Importing reviews from CSV file..."
    csv_file_name = ENV["CSV_FILE_NAME"] ||= "reviews.csv"
    csv_text = File.read(Rails.root.join("db/imports/#{csv_file_name}").to_s)
    csv = CSV.parse(csv_text, headers: true, encoding: "ISO-8859-1")

    puts "Importing reviews from CSV file #{csv_file_name}..."

    reviews = {}
    movies = {}

    csv.each do |row|
      puts "Importing review: #{row["Review"]}"
      reviews[row["Review"]] ||= Review.new(review: row["Review"], stars: row["Stars"], user: row["User"])
      review = reviews[row["Review"]]

      puts "Importing movie: #{row["Movie"]}"
      movies[row["Movie"]] ||= Movie.find_or_initialize_by(title: row["Movie"])
      movie = movies[row["Movie"]]

      review.movie = movie
    end

    reviews.each_value do |review|
      puts "Saving review: #{review.review}"
      review.save!
      puts "Saved review: #{review.review}"
    rescue => e
      puts "Error: #{e.message} trying to save #{review.review}"
    end
  rescue => e
    puts "Error: #{e.message}"
  end
end

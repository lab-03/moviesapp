# == Schema Information
#
# Table name: movies
#
#  id          :bigint           not null, primary key
#  description :text
#  title       :string
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_movies_on_lower_title  (lower((title)::text)) UNIQUE
#
class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :movie_directors, dependent: :destroy
  has_many :directors, through: :movie_directors

  has_many :movie_actors, dependent: :destroy
  has_many :actors, through: :movie_actors

  has_many :movie_locations, dependent: :destroy
  has_many :locations, through: :movie_locations

  has_many :movie_countries, dependent: :destroy
  has_many :countries, through: :movie_countries

  validates :title, presence: true, uniqueness: {case_sensitive: false}

  scope :by_actor_name, ->(name) { where(id: MovieActor.by_actor_name(name).select(:movie_id)) }

  scope :order_by_rating,
    lambda {
      select("movies.*, coalesce(avg(reviews.stars), 0) as avg_rating")
        .left_joins(:reviews)
        .group("movies.id")
        .order(avg_rating: :desc)
    }

  def name
    title
  end

  def actor_names
    actors.map(&:name).join(", ")
  end

  def director_names
    directors.map(&:name).join(", ")
  end

  def country_names
    countries.map(&:name).join(", ")
  end
end

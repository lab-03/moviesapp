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
  has_many :movie_directors, dependent: :destroy
  has_many :directors, through: :movie_directors

  has_many :movie_actors, dependent: :destroy
  has_many :actors, through: :movie_actors

  has_many :movie_locations, dependent: :destroy
  has_many :locations, through: :movie_locations

  has_many :movie_countries, dependent: :destroy
  has_many :countries, through: :movie_countries

  validates :title, presence: true, uniqueness: { case_sensitive: false }
end

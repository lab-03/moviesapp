# == Schema Information
#
# Table name: movie_locations
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  location_id :bigint           not null
#  movie_id    :bigint           not null
#
# Indexes
#
#  index_movie_locations_on_location_id  (location_id)
#  index_movie_locations_on_movie_id     (movie_id)
#
# Foreign Keys
#
#  fk_rails_...  (location_id => locations.id)
#  fk_rails_...  (movie_id => movies.id)
#
class MovieLocation < ApplicationRecord
  belongs_to :movie
  belongs_to :location
end

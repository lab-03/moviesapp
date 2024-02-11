# == Schema Information
#
# Table name: movie_directors
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  director_id :bigint           not null
#  movie_id    :bigint           not null
#
# Indexes
#
#  index_movie_directors_on_director_id  (director_id)
#  index_movie_directors_on_movie_id     (movie_id)
#
# Foreign Keys
#
#  fk_rails_...  (director_id => directors.id)
#  fk_rails_...  (movie_id => movies.id)
#
class MovieDirector < ApplicationRecord
  belongs_to :movie
  belongs_to :director
end

# == Schema Information
#
# Table name: reviews
#
#  id         :bigint           not null, primary key
#  review     :text
#  stars      :integer
#  user       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  movie_id   :bigint           not null
#
# Indexes
#
#  index_reviews_on_movie_id  (movie_id)
#
# Foreign Keys
#
#  fk_rails_...  (movie_id => movies.id)
#
class Review < ApplicationRecord
  belongs_to :movie

  validates :user, presence: true
  validates :stars, inclusion: { in: 1..5 }, presence: true
end

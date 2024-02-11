# == Schema Information
#
# Table name: actors
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_lower_name  (lower((name)::text)) UNIQUE
#
class Actor < ApplicationRecord
  has_many :movie_actors, dependent: :destroy
  has_many :movies, through: :movie_actors

  validates :name, presence: true, uniqueness: {case_sensitive: false}

  scope :by_name, ->(name) { where(arel_table[:name].lower.matches("%#{name.downcase}%")) }
end

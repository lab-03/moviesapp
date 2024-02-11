class AddUniqueIndexOnMoviesTitle < ActiveRecord::Migration[7.1]
  def change
    # unique index insensitive case
    add_index :movies, "lower(title)", unique: true
  end
end

class AddIndexToUsersName < ActiveRecord::Migration[7.1]
  def change
    add_index :actors, "lower((name)::text)", unique: true, name: "index_users_on_lower_name"
  end
end

class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.belongs_to :movie, null: false, foreign_key: true
      t.string :user
      t.integer :stars
      t.text :review

      t.timestamps
    end
  end
end

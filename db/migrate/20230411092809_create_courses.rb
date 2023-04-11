class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.string :category
      t.integer :rating
      t.text :syllabus
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

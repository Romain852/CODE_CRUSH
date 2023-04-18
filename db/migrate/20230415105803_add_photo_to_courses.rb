class AddPhotoToCourses < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :photo, :string
  end
end

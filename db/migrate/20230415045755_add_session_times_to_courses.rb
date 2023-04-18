class AddSessionTimesToCourses < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :session_start, :datetime
    add_column :courses, :session_end, :datetime
  end
end

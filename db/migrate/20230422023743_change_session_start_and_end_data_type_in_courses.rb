class ChangeSessionStartAndEndDataTypeInCourses < ActiveRecord::Migration[7.0]
  def change
    change_column :courses, :session_start, :datetime
    change_column :courses, :session_end, :datetime
  end
end

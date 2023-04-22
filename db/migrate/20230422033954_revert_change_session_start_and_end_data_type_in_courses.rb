class RevertChangeSessionStartAndEndDataTypeInCourses < ActiveRecord::Migration[7.0]
  def change
    def up
      change_column :courses, :session_start, :datetime
      change_column :courses, :session_end, :datetime
    end

    def down
      change_column :courses, :session_start, :date
      change_column :courses, :session_end, :date
    end
  end
end

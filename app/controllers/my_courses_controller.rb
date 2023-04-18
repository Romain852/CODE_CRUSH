class CoursesController < ApplicationController
  def my_courses
    @courses = current_user.courses
  end
end

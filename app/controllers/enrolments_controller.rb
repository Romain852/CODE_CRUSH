class EnrolmentsController < ApplicationController
  def index
    @enrolments = current_user.enrolments
  end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :enrolments
  has_many :courses, through: :enrolments, source: :course
  has_many :reviews, through: :enrolments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def enrolled_in?(course)
    courses.include?(course)
  end
end

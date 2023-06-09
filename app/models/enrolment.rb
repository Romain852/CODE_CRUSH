class Enrolment < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_many :reviews, dependent: :destroy

  validates :user, presence: true
  validates :course, presence: true
end

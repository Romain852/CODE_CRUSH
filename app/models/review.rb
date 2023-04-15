class Review < ApplicationRecord
  belongs_to :enrolment
  belongs_to :user

  validates :rating, presence: true
  validates :enrolment_id, presence: true
end

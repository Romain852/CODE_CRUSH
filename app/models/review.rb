class Review < ApplicationRecord
  belongs_to :enrolment

  validates :rating, presence: true
  validates :enrolment_id, presence: true
end

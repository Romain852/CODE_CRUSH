class Course < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :category, presence: true, inclusion: { in: %w(Fullstack Data) }
  validates :syllabus, presence: true
  validates :rating, inclusion: { in: 1..5 }
end

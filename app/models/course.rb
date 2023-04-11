class Course < ApplicationRecord
  belongs_to :user

  CATEGORIES = %w[Fullstack Data]

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :category, presence: true
  validates :syllabus, presence: true
end

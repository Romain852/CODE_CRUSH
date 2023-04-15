class Course < ApplicationRecord
  belongs_to :user
  has_many :enrolments, dependent: :destroy
  has_many :students, through: :enrolments, source: :user
  has_many :reviews, through: :enrolments
  has_one_attached :syllabus

  CATEGORIES = %w[Fullstack Data]

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :category, presence: true
  validates :syllabus, presence: true
end

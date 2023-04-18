class Course < ApplicationRecord
  include PgSearch::Model

  belongs_to :user
  has_many :enrolments, dependent: :destroy
  has_many :students, through: :enrolments, source: :user
  has_many :reviews, through: :enrolments
  has_one_attached :photo

  CATEGORIES = %w[Fullstack Data]

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :category, presence: true
  validates :category, inclusion: { in: CATEGORIES }
  validates :syllabus, presence: true

  serialize :syllabus, Array
  after_initialize :set_default_syllabus

  def set_default_syllabus
    self.syllabus ||= []
  end

  pg_search_scope :search,
  against: [:title, :description],
  using: {
    tsearch: { prefix: true }
  }

end

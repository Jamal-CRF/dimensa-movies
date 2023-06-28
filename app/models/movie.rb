class Movie < ApplicationRecord
  before_validation :set_default_country

  validates :title, presence: { message: "must be provided" }
  validates :genre, presence: { message: "must be provided" }
  validates :year, presence: { message: "must be provided" }
  validates :country, presence: { message: "must be provided" }
  validates :published_at, presence: { message: "must be provided" }
  validates :description, presence: { message: "must be provided" }
  validates :title, uniqueness: { message: "must be unique" }

  private

  def set_default_country
    self.country ||= "Country not informed"
  end
end

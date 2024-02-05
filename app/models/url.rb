class Url < ApplicationRecord

  scope :recent_first, -> { order(created_at: :desc) }

  validates :original_url, presence: true

  before_validation :shortener, on: :create

  def shortener
    self.short_code ||= SecureRandom.hex(3)
  end

  def total_visit_count
    self.sum(:count)
  end
end

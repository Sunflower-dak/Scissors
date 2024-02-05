class Url < ApplicationRecord

  scope :recent_first, -> { order(created_at: :desc) }

  validates :url, presence: true

  def shortener
    SecureRandom.hex(6)
  end
end

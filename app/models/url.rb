class Url < ApplicationRecord

  scope :recent_first, -> { order(created_at: :desc) }

  validates :original_url, presence: true
end

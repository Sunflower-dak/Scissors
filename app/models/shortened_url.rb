class ShortenedUrl < ApplicationRecord
  

    after_create :short_code

    belongs_to :user, optional: true

    validates :original_url, presence: true
    validates :sanitize_url, presence: true, uniqueness: true

    before_validation :short_code, on: :create


    def short_code
      self.sanitize_url  ||= SecureRandom.uuid[0..5]
    end
end

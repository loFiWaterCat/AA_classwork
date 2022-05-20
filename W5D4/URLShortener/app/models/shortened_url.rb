class ShortenedUrl < ApplicationRecord
  validates [:long_urls, :short_urls], uniqueness: true, presence: true
end

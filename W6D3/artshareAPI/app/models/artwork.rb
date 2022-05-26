class Artwork < ApplicationRecord
    validates :artist_id, presence: true, uniqueness: {scope: :title}
    validates :title, presence: true
    validates :image_url, presence: true

    has_many :artwork_shares,
        class_name: 'ArtworkShare',
        primary_key: :id,
        foreign_key: :artwork_id

    has_many :shared_viewers, through: :artwork_shares, source: :viewer

    belongs_to :artist, 
        class_name: 'User',
        primary_key: :id,
        foreign_key: :artist_id

end

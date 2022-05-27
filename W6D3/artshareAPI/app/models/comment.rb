class Comment < ApplicationRecord
    validates :user_id, presence: true
    validates :artwork_id, presence: true
    validates :body, presence: true

    belongs_to :artwork
    
    belongs_to :author,
        class_name: 'User',
        foreign_key: :user_id
end

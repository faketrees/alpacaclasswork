class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    # validates :email, presence: true

    has_many :artworks,
        foreign_key: :artist_id,
        class_name: :Artwork,
        dependet: :destroy

    has_many :artwork_shares,
        foreign_key: :viewer_id,
        class_name: :ArtworkShare,
        dependet: :destroy

    has_many :shared_artworks,
        through: :artwork_shares,
        source: :artwork

end
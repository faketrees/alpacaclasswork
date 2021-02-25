class Artwork < ApplicationRecord
    validates :title, :artist_id, :image_url, presence: true
    validates :title, uniqueness: {scope: :artist_id }

    belongs_to :artist,
        foreign_key: :artist_id,
        class_name: :User

    has_many :artwork_shares,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare

    has_many :shared_viewers,
        through: :artwork_shares,
        source: :viewer
end




#Jug's painting "Z" 
#Jug now cannot have a second painting of "Z"
#"Z" can be viewed by Aladdin
#"Z" can be viewed by Faketrees
#"Z" cannot be viewed again by Faketrees again. 

#so artist_id: 3 , title: "Z" is going to be unique
#cannot have another artist_id: 3 , title: "Z"
#but we can have artist_id: 2, title: "Z"


#Aladdin can also have 1 painting "Z"
class Post < ApplicationRecord
    belongs_to :user
    validates :content, presence: true, length: { maximum: 200 } 
    has_one_attached :photo
    def thumbnail(size)
        photo.variant(resize_to_fill: size)
      end
    
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :recoverable and :omniauthable
  devise :database_authenticatable, :registerable,
         :trackable, :rememberable, :validatable
  validates :name, presence: true, length: { in: 2..20 } 
  has_many :posts
  has_one_attached :photo
  def thumbnail(size)
    photo.variant(resize_to_fill: size)
  end
end

class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :spots, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_spots, through: :likes, source: :spot

  def already_liked?(spot)
    self.likes.exists?(spot_id: spot.id)
  end

  has_many :comments, dependent: :destroy

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  validates :profile, length: { maximum: 200 } 
  validates :email, uniqueness: true
  validates :username, uniqueness: true
        
  def email_required?
    false
  end
        
  def email_changed?
    false
  end

end

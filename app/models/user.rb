class User < ApplicationRecord
  mount_uploader :profile_image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :spots, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_spots, through: :likes, source: :spot
  has_many :comments, dependent: :destroy
  def already_liked?(spot)
    self.likes.exists?(spot_id: spot.id)
  end

  has_many :how_tos, dependent: :destroy
  has_many :fights, dependent: :destroy
  has_many :fought_how_tos, through: :fights, source: :how_to
  has_many :advices, dependent: :destroy
  def already_fought?(how_to)
    self.fights.exists?(how_to_id: how_to.id)
  end

  has_many :notes, dependent: :destroy
  has_many :archives, dependent: :destroy
  has_many :archived_notes, through: :archives, source: :note
  has_many :questions, dependent: :destroy
  def already_archived?(note)
    self.archives.exists?(note_id: note.id)
  end

  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user

  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end



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

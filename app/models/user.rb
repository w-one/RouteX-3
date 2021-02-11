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


  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships

  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships

  def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end

  def follow!(other_user)
    following_relationships.create!(following_id: other_user.id)
  end

  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end



  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  validates :profile, length: { maximum: 30 } 
  # validates :email, uniqueness: true
  validates :username, uniqueness: true

  # def email_required?
  #   false
  # end

  # def email_changed?
  #   false
  # end
  

end

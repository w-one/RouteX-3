class Advice < ApplicationRecord
  belongs_to :user
  belongs_to :how_to

  validates :content, presence: true
end

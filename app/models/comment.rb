class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :spot

  validates :rate, presence: true
end

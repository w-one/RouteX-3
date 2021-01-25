class Fight < ApplicationRecord
  belongs_to :how_to
  belongs_to :user

  validates_uniqueness_of :how_to_id, scope: :user_id
end

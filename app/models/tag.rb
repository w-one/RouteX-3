class Tag < ApplicationRecord
  has_many :spot_tag_relations, dependent: :destroy
  has_many :spot, through: :spot_tag_relations, dependent: :destroy
end

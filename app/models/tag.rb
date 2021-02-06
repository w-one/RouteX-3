class Tag < ApplicationRecord
  has_many :post_tag_relations, dependent: :destroy
  has_many :spots, through: :post_tag_relations, dependent: :destroy
end

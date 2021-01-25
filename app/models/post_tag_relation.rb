class PostTagRelation < ApplicationRecord
  belongs_to :spot
  belongs_to :tag
end

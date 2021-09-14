class FollowRequest < ApplicationRecord
  belongs_to :teacher
  belongs_to :parent
end

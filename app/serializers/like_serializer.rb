class LikeSerializer < ActiveModel::Serializer
  attributes :id, :logged_in_id, :liked_id
end

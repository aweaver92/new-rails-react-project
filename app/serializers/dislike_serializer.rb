class DislikeSerializer < ActiveModel::Serializer
  attributes :id, :logged_in_id, :disliked_id
end

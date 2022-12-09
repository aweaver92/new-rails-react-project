class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password, :height, :mass, :hair_color, :skin_color, :eye_color, :birth_year, :gender, :homeworld
end

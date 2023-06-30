class GuestSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name
  has_one :friend
end
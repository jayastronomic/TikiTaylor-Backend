class Guest < ApplicationRecord
  has_one :friend, class_name: 'Guest', foreign_key: 'friend_id'
  belongs_to :friend_of, class_name: 'Guest', optional: true
end
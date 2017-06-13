class User < ApplicationRecord
	# because events refers to the user that created in as "creator", 
	# we specify the foreign key that will refer to the user(event creator) id
	has_many :events, :foreign_key => "creator_id"
	validates :name, presence: true
end

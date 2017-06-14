class User < ApplicationRecord
	# because events refers to the user that created in as "creator", 
	# we specify the foreign key that will refer to the user(event creator) id
	has_many :events, :foreign_key => "creator_id"
	validates :name, presence: true
	has_many :event_attendances, :foreign_key => :attendee_id
	has_many :attending_events, :through => :event_attendances, :source => :event_attended #no _id
end

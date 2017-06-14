class User < ApplicationRecord
	# events can refer to user as "creator"
	has_many :events, :foreign_key => "creator_id"
	validates :name, presence: true

	# in an event attedance, user is an attendee
	has_many :event_attendances, :foreign_key => :attendee_id

	# can see what events (attending_events) user is attending by looking through the event_attendances tables via 'user.attending_events'
	has_many :attending_events, :through => :event_attendances, :source => :event_attended #no _id
end

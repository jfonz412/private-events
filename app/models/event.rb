class Event < ApplicationRecord
	# refers to the user that created this event as "creator"
	belongs_to :creator, :class_name => "User" 
	validates :name, presence: true
	
	# EventAttendance associations

	# has many event_attendance tables, where this event is refered to as event_attended_id
	has_many :event_attendances, :foreign_key => :event_attended_id 

	# has many attendees (can name this whatever), found through the event_attendance tables. 
	has_many :attendees, :through => :event_attendances, :source => :attendee # allows you to call 'event.attendees' to see who is coming 
end

# attendee = attendee_id without the id tag...
class EventAttendance < ApplicationRecord
	# belongs to          which is a    
	belongs_to :attendee, :class_name => 'User'
	belongs_to :event_attended, :class_name => 'Event'
end

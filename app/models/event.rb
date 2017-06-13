class Event < ApplicationRecord
	# refers to the user that created this event as "creator"
	belongs_to :creator, :class_name => "User" 
	validates :name, presence: true
end

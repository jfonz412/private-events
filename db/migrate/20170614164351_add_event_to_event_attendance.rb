class AddEventToEventAttendance < ActiveRecord::Migration[5.0]
  def change
    add_reference :event_attendances, :event, foreign_key: true
  end
end

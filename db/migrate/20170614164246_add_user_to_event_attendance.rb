class AddUserToEventAttendance < ActiveRecord::Migration[5.0]
  def change
    add_reference :event_attendances, :user, foreign_key: true
  end
end

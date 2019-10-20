class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.datetime :date
      t.integer :goal_id
      t.integer :coach_id

      t.timestamps
    end
  end
end

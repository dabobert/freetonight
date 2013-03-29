class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.string :name
      t.datetime :start_date_time
      t.integer :duration
      t.integer :repeat_type_id
      t.integer :frequency
      t.timestamps
    end
  end
end

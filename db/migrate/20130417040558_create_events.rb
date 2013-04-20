class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :start_date_time
      t.integer :duration
      t.text :schedule_text
      t.timestamps
    end
  end
end

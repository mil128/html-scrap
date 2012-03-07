class CreateRunDates < ActiveRecord::Migration
  def self.up
    create_table :run_dates do |t|
      t.date :from_date
      t.date :to_date

      t.timestamps
    end
  end

  def self.down
    drop_table :run_dates
  end
end

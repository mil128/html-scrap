class ChangeScraps < ActiveRecord::Migration
  def self.up
    change_column :scraps, :from_date, :date
    change_column :scraps, :to_date, :date
  end

  def self.down
    change_column :scraps, :from_date, :datetime
    change_column :scraps, :to_date, :datetime
  end
end

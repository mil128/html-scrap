class RemoveFromToDateFromScraps < ActiveRecord::Migration
  def self.up
    remove_column :scraps, :from_date
    remove_column :scraps, :to_date
  end

  def self.down
    add_column :scraps, :to_date, :date
    add_column :scraps, :from_date, :date
  end
end

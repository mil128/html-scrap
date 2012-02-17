class AddFromDateToScraps < ActiveRecord::Migration
  def self.up
    add_column :scraps, :from_date, :datetime
    add_column :scraps, :to_date, :datetime
  end

  def self.down
    remove_column :scraps, :to_date
    remove_column :scraps, :from_date
  end
end

class AddTagToScraps < ActiveRecord::Migration
  def self.up
    add_column :scraps, :tag, :string
  end

  def self.down
    remove_column :scraps, :tag
  end
end

class CreateDetailMatches < ActiveRecord::Migration
  def self.up
    create_table :detail_matches do |t|
      t.string :order_id
      t.string :order_status
      t.string :order_desc

      t.timestamps
    end
  end

  def self.down
    drop_table :detail_matches
  end
end

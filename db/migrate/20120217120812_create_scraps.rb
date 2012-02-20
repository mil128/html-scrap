class CreateScraps < ActiveRecord::Migration
  def self.up
    create_table :scraps do |t|
      t.string :order_id
      t.datetime :order_date
      t.float :order_amt
      t.string :order_status
      t.string :payment_mode
      t.string :mil_tx_id
      t.string :order_desc
      t.integer :borrower_id
      t.string :borrower_name
      t.string :cust_name
      t.string :cust_email
      t.string :cust_phone
      t.text :cust_addr
      t.datetime :from_date
      t.datetime :to_date

      t.timestamps
    end
  end

  def self.down
    drop_table :scraps
  end
end

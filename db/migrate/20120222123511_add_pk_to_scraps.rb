class AddPkToScraps < ActiveRecord::Migration
  def self.up
    remove_column :scraps,:id
    say "dropped column id"
    execute "alter table scraps add primary key(order_id)"
    say "primary key assigned as order_id"
  end

  def self.down
    execute "alter table scraps drop primary key"
    say "primary key from order_id removed"
    execute "alter table scraps add id int auto_increment key"
    say "restored id as auto increment and pk"
  end
end

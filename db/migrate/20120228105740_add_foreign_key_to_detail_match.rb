class AddForeignKeyToDetailMatch < ActiveRecord::Migration
  def self.up
    execute "alter table detail_matches add constraint fk_scraps foreign key(order_id) references scraps(order_id)"
    say "Foreign key added"
  end

  def self.down
    execute "alter table detail_matches drop foreign key fk_scraps"
    say "Foreign key removed"
  end
end

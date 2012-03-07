class DetailMatch < ActiveRecord::Base
  belongs_to :scrap, :class_name=>"Scrap", :foreign_key =>"order_id"
end

class DropTableOderDetails < ActiveRecord::Migration[5.2]
  def change
     drop_table :oder_details
  end
end

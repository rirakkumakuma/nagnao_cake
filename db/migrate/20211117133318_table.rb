class Table < ActiveRecord::Migration[5.2]
  def change
    drop_table :Admins
  end
end

class DropTableOders < ActiveRecord::Migration[5.2]
  def change
    drop_table :oders
  end
end

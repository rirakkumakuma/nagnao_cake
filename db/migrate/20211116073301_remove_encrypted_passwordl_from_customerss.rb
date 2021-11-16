class RemoveEncryptedPasswordlFromCustomerss < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :encrypted_password, :string
  end
end

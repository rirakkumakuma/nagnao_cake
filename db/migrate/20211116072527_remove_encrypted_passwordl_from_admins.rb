class RemoveEncryptedPasswordlFromAdmins < ActiveRecord::Migration[5.2]
  def change
    remove_column :admins, :encrypted_password, :string
  end
end

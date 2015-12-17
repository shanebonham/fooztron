class AddUidToUser < ActiveRecord::Migration
  def change
    add_column :users, :uid, :string
    remove_column :users, :monk_authentication_token, :string
    remove_column :users, :password, :string
  end
end

class AddOmniauthToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :provider, :string
    add_column :users, :uid, :string

    add_index :users, :uid
    add_index :users, [:provider, :uid]
  end
end

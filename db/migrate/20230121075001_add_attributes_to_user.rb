class AddAttributesToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :user, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :password, :string
    add_column :users, :address, :string
    add_column :users, :phone_number, :string
  end
end

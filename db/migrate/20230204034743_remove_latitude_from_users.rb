class RemoveLatitudeFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :latitude, :string
    remove_column :users, :longitude, :string
  end
end

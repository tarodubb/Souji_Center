class RemoveCategoriesFromServices < ActiveRecord::Migration[7.0]
  def change
    remove_column :services, :category
  end
end

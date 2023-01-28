class RenameEndDateToEndTime < ActiveRecord::Migration[7.0]
  def change
    rename_column :bookings, :end_date, :end_time
  end
end

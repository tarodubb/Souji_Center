class Booking < ApplicationRecord
  enum :status, [ :pending, :approved, :rejected]
  belongs_to :user
  belongs_to :service
end

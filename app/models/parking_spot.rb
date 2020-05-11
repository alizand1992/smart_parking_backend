# frozen_string_literal: true

class ParkingSpot < ApplicationRecord
  belongs_to :location, optional: true
end

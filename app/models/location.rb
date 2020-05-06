# frozen_string_literal: true

class Location < ApplicationRecord
  has_many :parking_spot, dependent: :destroy
end

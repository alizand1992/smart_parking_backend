# frozen_string_literal: true

class ParkingSpotsController < ApplicationController
  def index
    spots = ParkingSpot.where(location_id: params[:location_id]).map do |spot|
      remove_date_attributes(spot)
    end

    render json: spots.to_json, status: :ok
  end

  def show
    render json: { parking_spot_id: params[:id] }.to_json
  end

  private

  def remove_date_attributes(spot)
    spot.attributes.without('created_at', 'updated_at')
  end
end

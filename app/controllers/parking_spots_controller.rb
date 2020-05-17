# frozen_string_literal: true

class ParkingSpotsController < ApplicationController
  def index
    spots = ParkingSpot.where(location_id: params['location_id']).map do |spot|
      remove_date_attributes(spot)
    end

    render json: spots.to_json, status: :ok
  end

  def all_parking_spots
    spots = ParkingSpot.all.map { |spot| remove_date_attributes(spot) }

    render json: spots.to_json, status: :ok
  end

  def sync
    params["parkingSpots"].each do |s|
      next if ParkingSpot.find_by(aws_id: s["id"]).present?
      spot = ParkingSpot.new
      spot.aws_id = s["id"]
      spot.number = s["id"]
      spot.save!
    end

    render json: { success: 'ok' }.to_json, status: :ok
  end

  def show
    render json: { parking_spot_id: params[:id] }.to_json, status: :ok
  end

  def available_spots_for_location
    spots = ParkingSpot.where(location_id: [params[:location_id], nil]).map do |spot|
      remove_date_attributes(spot)
    end

    render json: spots.to_json, status: :ok
  end

  private

  def remove_date_attributes(spot)
    spot.attributes.without('created_at', 'updated_at')
  end
end

# frozen_string_literal: true

class LocationsController < ApplicationController
  def index
    locations = Location.all.map do |loc|
      remove_date_attributes(loc)
    end
    render json: locations.to_json, status: :ok
  end

  def show
    location = remove_date_attributes(Location.find(params[:id]))

    render json: location.to_json, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'No location with that id available' }, status: :not_found
  rescue StandardError => e
    render json: { error: e.message }, status: :internal_server_error
  end

  private

  def remove_date_attributes(loc)
    loc.attributes.without('created_at', 'updated_at')
  end
end

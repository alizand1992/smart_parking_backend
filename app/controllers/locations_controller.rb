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
    render json: { error: 'No location with that id available' }.to_json, status: :not_found
  rescue StandardError => e
    render json: { error: e.message }.to_json, status: :internal_server_error
  end

  def new
    render json: { authenticity_token: form_authenticity_token }.to_json, status: :ok
  end

  def create
    loc = Location.new({ name: params[:name], desc: params[:desc] })

    if loc.name.blank? || loc.desc.blank?
      raise 'Name and Description cannot be blank'
    end

    loc.save!

    render json: loc.to_json, status: :ok
  rescue => e
    render json: { errors: e.message }.to_json, status: :internal_server_error
  end

  def link_parking_spot

  end

  def unlink_parking_spot

  end

  private

  def remove_date_attributes(loc)
    loc.attributes.without('created_at', 'updated_at')
  end
end

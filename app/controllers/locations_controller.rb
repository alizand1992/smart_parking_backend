class LocationsController < ActionController::Base
  def index
    locations = Location.all().map do |loc|
      remove_date_attributes(loc)
    end
    render json: locations.to_json, status: 200
  end

  def show
    location = remove_date_attributes(Location.find(params[:id]))

    render json: location.to_json, status: 200
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'No location with that id available' }, status: 404
  rescue => e
    render json: { error: e.message }, status: 500
  end

  private

  def remove_date_attributes(loc)
    loc.attributes.without('created_at', 'updated_at')
  end
end
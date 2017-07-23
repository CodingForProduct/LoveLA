class PlacesController < ApplicationController

  def index
    @term = params[:term] || 'dinner'
    @longitude = params[:stop][:longitude]
    @latitude = params[:stop][:latitude]
    @place = search(@term,@longitude,@latitude)
  end

  def show
    @business_id = params[:id]
    @business = get_business(@business_id)
    if @business.nil? || @business.empty?
      @name = 'Request Not Found'
    else
      @id = params[:id]
      @business = get_business(@id)
      @name = @business['name']
      @website = @business['url']
      @hours = get_business_hours(@business)
      @price = @business['price']
      @display_phone = @business['display_phone']
      @rating = @business['rating']
      @business_snippet_text = @business['snippet_text']
      @photo = format_photos(@business)
      @deals = @business['deals']
      @location = get_business_location
      @coordinates = @business['coordinates']
      @categories = categories
    end
  end

end

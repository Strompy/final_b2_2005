class FlightPassengersController < ApplicationController
  def create
    passenger = Passenger.find(params[:id])
    flight = Flight.where(number: flight_params[:number])
    passenger.flights << flight
    redirect_to "/passengers/#{passenger.id}"
  end

  private

  def flight_params
    params.permit(:number)
  end
end

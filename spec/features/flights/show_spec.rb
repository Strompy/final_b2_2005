require "rails_helper"

RSpec.describe "Flight Show Page" do
  before :each do
    @airline = Airline.create!(name: "Trans American Airlines")
    @flight1 = @airline.flights.create!(number: "1727", date: "08/03/20", time: "10:12", departure_city: "Denver", arrival_city: "Reno")
    @passenger1 = Passenger.create!(name: "Kareem Abdul-Jabbar", age: 32)
    @passenger2 = Passenger.create!(name: "Elaine Dickinson", age: 25)
    @passenger3 = Passenger.create!(name: "Ted Striker", age: 30)
    @passenger4 = Passenger.create!(name: "Otto", age: 37)
    FlightPath.create!(flight: @flight1, passenger: @passenger1)
    FlightPath.create!(flight: @flight1, passenger: @passenger2)
    FlightPath.create!(flight: @flight1, passenger: @passenger3)
    FlightPath.create!(flight: @flight1, passenger: @passenger4)
  end
  it "shows all flight information" do

    visit "/flights/#{@flight1.id}"

    expect(page).to have_content(@flight1.name)
    expect(page).to have_content(@flight1.date)
    expect(page).to have_content(@flight1.time)
    expect(page).to have_content(@flight1.departure_city)
    expect(page).to have_content(@flight1.arrival_city)
    expect(page).to have_content(@flight1.airline.name)

    @flight1.passengers.each do |passenger|
      expect(page).to have_content(passenger.name)
    end
  end
end

# User Story 1, Flights Show Page
# ​
# As a visitor
# When I visit a flights show page
# I see all of that flights information including:
#   - number
#   - date
#   - time
#   - departure city
#   - arrival city
# And I see the name of the airline this flight belongs
# And I see the names of all of the passengers on this flight
# ```

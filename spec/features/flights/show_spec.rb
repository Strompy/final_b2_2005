require "rails_helper"

RSpec.describe "Flight Show Page" do
  before :each do
    @airline = Airline.create!(name: "Trans American Airlines")
    @flight1 = @airline.flights.create!(number: "1727", date: "08/03/20", time: "10:12", departure_city: "Denver", arrival_city: "Reno")
    @passenger1 = Passenger.create!(name: "Kareem Abdul-Jabbar", age: 32)
    @passenger2 = Passenger.create!(name: "Elaine Dickinson", age: 25)
    @passenger3 = Passenger.create!(name: "Ted Striker", age: 30)
    @passenger4 = Passenger.create!(name: "Otto", age: 3)
    @passenger5 = Passenger.create!(name: "Joey", age: 8)
    FlightPassenger.create!(flight: @flight1, passenger: @passenger1)
    FlightPassenger.create!(flight: @flight1, passenger: @passenger2)
    FlightPassenger.create!(flight: @flight1, passenger: @passenger3)
    FlightPassenger.create!(flight: @flight1, passenger: @passenger4)
    FlightPassenger.create!(flight: @flight1, passenger: @passenger5)
  end
  it "shows all flight information" do
    visit "/flights/#{@flight1.id}"

    expect(page).to have_content(@flight1.number)
    expect(page).to have_content(@flight1.date)
    expect(page).to have_content(@flight1.time)
    expect(page).to have_content(@flight1.departure_city)
    expect(page).to have_content(@flight1.arrival_city)
    expect(page).to have_content(@flight1.airline.name)

    @flight1.passengers.each do |passenger|
      expect(page).to have_content(passenger.name)
    end
  end
  it "displays count of minors and adults on the flight" do
    visit "/flights/#{@flight1.id}"

    expect(page).to have_content("Number of minors: 2")
    expect(page).to have_content("Number of adults: 3")
  end
end

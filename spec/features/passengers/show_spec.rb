require "rails_helper"

RSpec.describe "Passenger Show Page" do
  before :each do
    @airline = Airline.create!(name: "Trans American Airlines")
    @flight1 = @airline.flights.create!(number: "1727", date: "08/03/20", time: "10:12", departure_city: "Denver", arrival_city: "Reno")
    @flight2 = @airline.flights.create!(number: "1235", date: "10/10/20", time: "12:10", departure_city: "Denver", arrival_city: "Seattle")
    @flight3 = @airline.flights.create!(number: "6566", date: "10/13/20", time: "17:45", departure_city: "Seattle", arrival_city: "Denver")
    @passenger1 = Passenger.create!(name: "Kareem Abdul-Jabbar", age: 32)
    @passenger2 = Passenger.create!(name: "Elaine Dickinson", age: 25)
    @passenger3 = Passenger.create!(name: "Ted Striker", age: 30)
    @passenger4 = Passenger.create!(name: "Otto", age: 37)
    FlightPassenger.create!(flight: @flight1, passenger: @passenger1)
    FlightPassenger.create!(flight: @flight1, passenger: @passenger2)
    FlightPassenger.create!(flight: @flight1, passenger: @passenger3)
    FlightPassenger.create!(flight: @flight1, passenger: @passenger4)
    FlightPassenger.create!(flight: @flight2, passenger: @passenger1)
    FlightPassenger.create!(flight: @flight3, passenger: @passenger1)
  end
  it "displays the passengers name and flights" do
    visit "/passengers/#{@passenger1.id}"

    expect(page).to have_content(@passenger1.name)

    within ".flights" do
      expect(page).to have_link(@flight1.number)
      expect(page).to have_link(@flight2.number)
      expect(page).to have_link(@flight3.number)
    end
    click_on "#{@flight1.number}"
    expect(current_path).to eq("/flights/#{@flight1.id}")
  end
end



# User Story 2, Passenger Show Page
# ​
# As a visitor
# When I visit a passengers show page
# I see that passengers name
# And I see a section of the page that displays all flight numbers of the flights for that passenger
# All flight numbers are links to that flight’s show page

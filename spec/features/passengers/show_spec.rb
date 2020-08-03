require "rails_helper"

RSpec.describe "Passenger Show Page" do
  before :each do
    @airline = Airline.create!(name: "Trans American Airlines")
    @flight1 = @airline.flights.create!(number: "1727", date: "08/03/20", time: "10:12", departure_city: "Denver", arrival_city: "Reno")
    @flight2 = @airline.flights.create!(number: "1235", date: "10/10/20", time: "12:10", departure_city: "Denver", arrival_city: "Seattle")
    @flight3 = @airline.flights.create!(number: "6566", date: "10/13/20", time: "17:45", departure_city: "Seattle", arrival_city: "Denver")
    @flight4 = @airline.flights.create!(number: "4213", date: "10/20/20", time: "20:00", departure_city: "Denver", arrival_city: "Santa Fe")
    @passenger1 = Passenger.create!(name: "Kareem Abdul-Jabbar", age: 32)
    @passenger2 = Passenger.create!(name: "Elaine Dickinson", age: 25)
    @passenger3 = Passenger.create!(name: "Ted Striker", age: 30)
    @passenger4 = Passenger.create!(name: "Otto", age: 18)
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

    visit "/passengers/#{@passenger1.id}"
    click_on "#{@flight2.number}"
    expect(current_path).to eq("/flights/#{@flight2.id}")
  end
  it "has link to a form to assign passenger to new flight" do
    visit "/passengers/#{@passenger1.id}"

    expect(page).to_not have_content(@flight4.number)

    fill_in :number, with: @flight4.number

    click_on "Submit"

    expect(current_path).to eq("/passengers/#{@passenger1.id}")

    expect(page).to have_link(@flight4.number)
  end
end

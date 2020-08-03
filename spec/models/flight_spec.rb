require "rails_helper"

RSpec.describe Flight do
  describe "validations" do
    it { should validate_presence_of :number }
    it { should validate_presence_of :date }
    it { should validate_presence_of :time }
    it { should validate_presence_of :departure_city }
    it { should validate_presence_of :arrival_city }
  end
  describe "relationships" do
    it { should belong_to :airline }
    it { should have_many :flight_passengers }
    it { should have_many(:passengers).through(:flight_passengers) }
  end
  describe "instance methods" do
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
    it "counts total_passengers_count" do
      expect(@flight1.total_passenger_count).to eq(5)
    end
    it "counts number_of_minors" do
      expect(@flight1.number_of_minors).to eq(2)
    end
    it "counts number_of_minors" do
      expect(@flight1.number_of_adults).to eq(3)
    end
  end
end

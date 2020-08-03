class Flight < ApplicationRecord
  validates_presence_of :number, :date, :time, :departure_city, :arrival_city

  belongs_to :airline
  has_many :flight_passengers
  has_many :passengers, through: :flight_passengers

  def total_passenger_count
    passengers.count
  end

  def number_of_minors
    passengers.where('passengers.age < 18').count
  end

  def number_of_adults
    passengers.where('passengers.age >= 18').count
  end
end

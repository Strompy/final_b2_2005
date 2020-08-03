# README

Base repository for B2 Final Assessment.

This repository requires and has rbeen tested on Ruby v2.5.3 and is based on Rails 5.1.7.

RSpec, SimpleCov, and Shoulda-Matchers have been installed and set up.


## Setup
1. fork this repo
2. clone your fork
3. `git clone <paste_repo>`
4. `cd final_b2_2005`
5. `bundle install`

When you run `bundle exec rspec` you should have 0 tests.

# BEM2 Final Technical Assessment
​
## Description
Field Trip is an app that allows a user to see airlines, flights, and passengers. Airlines have many flights, and flights belong to an airline. Flights have many passengers and passengers can have many flights. Make sure to read all instructions, tasks, and user stories before getting started. Model testing for relationships and any class methods is required, you do not need to test for validations.
​
## Instructions
​
* Work on this assessment independently. DO NOT discuss with anyone.
* Fork the assessment repository
* Clone your fork
* Run `bundle`
* Run `rake db:create`
* Complete the stories below
* Commit Frequently (at least every 10-15 minutes)
* Push your code to your fork once the time is up (not before!)
​
## Database information
* Airlines have a name
 (Ex: Airline.create(name: “Frontier”))
* Flights have a number, date, time, departure city, and arrival city
 (Ex: Flight.create(number: “1727”, date: “08/03/20”, departure_city: “Denver”, arrival_city: “Reno”)) -- for this app, it does not matter how you format the flight’s date
* Passengers have a name and age
 (Ex: Passenger.create(name: “Joe”, age: 7))
​
```
User Story 1, Flights Show Page
​
As a visitor
When I visit a flights show page
I see all of that flights information including:
  - number
  - date
  - time
  - departure city
  - arrival city
And I see the name of the airline this flight belongs
And I see the names of all of the passengers on this flight
```
​
```
User Story 2, Passenger Show Page
​
As a visitor
When I visit a passengers show page
I see that passengers name
And I see a section of the page that displays all flight numbers of the flights for that passenger
All flight numbers are links to that flight’s show page
```
​
```
User Story 3, Assign a Passenger to a Flight
​
As a visitor
When I visit a passengers show page
I see a form to add a flight
When I fill in the form with a flight number (assuming these will always be unique)
And click submit
I'm taken back to the passengers show page
And I can see the flight number of the flight I just added
```
​
```
User Story 4, Count of Minors and Adults on Flight
​
As a visitor
When I visit a flights show page
I see the number of minors on the flight (minors are any passengers that are under 18)
And I see the number of adults on the flight (adults are any passengers that are 18 or older)
```

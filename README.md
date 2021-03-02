## Specification

We have some customer records in a text file as `customers.json` -- one customer per line, JSON-encoded. We want to invite any customer within 100km of our Dublin office for some food and drinks on us. Write a program that will read the full list of customers and output the names and user ids of matching customers (within 100km), sorted by User ID in ascending. You can use the first formula(law of cosines) from this [Wikipedia article](https://en.wikipedia.org/wiki/Great-circle_distance) to calculate distance. Don't forget, you'll need to convert degrees to radians. The GPS coordinates for our Dublin office are 53.339428, -6.257664.

Resolution:
* Code is written in Ruby with test-cases.
* The scope of the parameter is optional, the default value is 100. You can change the range if you prefer.
* Dublin Office location is mentioned in the application itself. You can change the office coordinates if you prefer.
* Distance is mentioned as default in KM. You can change the distance unit and make change `distance_calculator` module of code. if you prefer.


## Setup and Run the programme:

```
$ git clone https://github.com/nehanakrani/intercom-problem.git
$ cd intercom-problem
$ bundle install
$ ruby invite.rb

Output:
User Id: 4, name: Ian Kehoe
User Id: 5, name: Nora Dempsey
User Id: 6, name: Theresa Enright
User Id: 8, name: Eoin Ahearn
User Id: 11, name: Richard Finnegan
User Id: 12, name: Christina McArdle
User Id: 13, name: Olive Ahearn
User Id: 15, name: Michael Ahearn
User Id: 17, name: Patricia Cahill
User Id: 23, name: Eoin Gallagher
User Id: 24, name: Rose Enright
User Id: 26, name: Stephen McArdle
User Id: 29, name: Oliver Ahearn
User Id: 30, name: Nick Enright
User Id: 31, name: Alan Behan
User Id: 39, name: Lisa Ahearn

```

## How to Run Spec

```ruby
$ bundle exec rspec spec

```

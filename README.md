# Scheduler app for Vayable

**Task**
* create a server that supports basic trip & schedule creation and scheduling lookup via JSON
* a trip has a name and vendor.
* a trip has schedules with max number of people, price per person, and what days/time it takes place.

**Assumption(s)**
* all events have a weekly recurrence

## Setup
```
bundle install
rake db:migrate
rails server
```

## Tests

```
rake test
```

## API
**Create trip**

POST /trips.json with 'name' and 'vendor' params
* name = name of the trip i.e. 'Scuba Mexico'
* vendor = vendor that is hosting the trip i.e. 'Scuba Club'

```
curl --include -X POST -d 'name=Scuba Mexico&vendor=Scuba Club' http://localhost:3000/trips.json
```

**See a list of all trips (without schedule)**

GET /trips.json

```
curl --include -X GET http://localhost:3000/trips.json
```

**Create schedule**

POST /trips/:trip_id/schedules.json with price, max_size, wdays, and time params
* price = the decimal cost per person i.e. '20.30' for $20.30
* wdays = an array of the numerical representation for the day (Sunday is 0, Monday is 1, etc) i.e. '[6,0]' for Saturday and Sunday
* max_size = the max number of occupants i.e. 5
* time = the time when the event will happen i.e. '12:30 pm'

```
curl --include -X POST -d 'price=32.50&max_size=1&wdays=[1,2]&time=12:50' http://localhost:3000/trips/1/schedules.json
```

**See a list of all schedules for a trip**

GET /trips/:trip_id/schedules.json

```
curl --include -X GET http://localhost:3000/trips/1/schedules.json
```

**See a list of trips and schedules by date**

GET /query_by_date.json with 'to' and 'from' params
* 'to' and 'from' = dates in the format 'YYYY/MM/DD'

```
curl --include -X GET -d 'from=2013/01/09&to=2013/01/19' http://localhost:3000/query_by_date.json
```


## TODO
* add service to format query_by_date format
* write tests

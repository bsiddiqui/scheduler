Scheduler app for Vayable

Task: create a server that supports basic trip & schedule creation and scheduling lookup via JSON
* a trip has a name and vendor.
* a trip has schedules with max number of people, price per person, what days/time it takes place.

Setup

Tests
rake test

API
TRIPS
create trip
POST /trips.json with 'name' and 'vendor' params
curl --include -X POST -d 'name=Scuba Mexico&vendor=Scuba Club' http://localhost:3000/trips.json

see a list of all trips (without schedule)
GET /trips.json
curl --include -X GET http://localhost:3000/trips.json

create schedule
POST /trips/:trip_id/schedules.json with _______ params

see a list of all schedules for a trip
GET /trips/:trip_id/schedules.json

Example:

Create two trips
* name="Skydiving", vendor="Las Vegas Air Adventures".
* name="Hot Air Balloon", vendor = "Las Vegas Balloon".

Create schedules
* Skydiving
  - Every tuesday at 3pm, limit 6 people, cost $100 person. 
  - Every saturday and sunday at noon, limit 4 people, cost $150 per person.
* Hot Air Ballon
  - Every weekday at noon, limit 4 people, cost $50.

Querying the schedule for 2013-8-19 (Monday) to 2013-8-24 (Saturday), e.g.
  curl --include -X POST -d '{"from": "2013-08-19", "to": "2013-08-24"}' https://localhost:3001/schedule

should then return
  * Skydiving Tuesday at 3pm.
  * Skydiving Saturday at noon.
  * Hot Air Balloon, Monday-Friday at noon 

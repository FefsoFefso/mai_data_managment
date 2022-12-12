begin;

-- СОЗДАЕМ УЖАСНЫЕ ТАБЛИЧКИ
-- их пришлось править, типы данных где то не было, где то были неправильные. Если что то не работает - проверь типы данных ( ͡~ ͜ʖ ͡°)
--CREATE TABLE circuits (circuitId INTEGER PRIMARY KEY, circuitRef VARCHAR, name VARCHAR, location VARCHAR, country VARCHAR, lat DECIMAL (8, 6), lng DECIMAL (9, 6), alt INTEGER, url VARCHAR);

--CREATE TABLE drivers (driverId INTEGER PRIMARY KEY, driverRef VARCHAR, number VARCHAR, code VARCHAR, forename VARCHAR, surname VARCHAR, dob VARCHAR, nationality VARCHAR, url VARCHAR);

--CREATE TABLE races (raceId INTEGER PRIMARY KEY, year INTEGER, round INTEGER, circuitId INTEGER REFERENCES circuits (circuitId), name VARCHAR, date DATE, time TIME, url VARCHAR);

--CREATE TABLE driver_standings (driverStandingsId INTEGER PRIMARY KEY, raceId INTEGER REFERENCES races (raceId), driverId INTEGER REFERENCES drivers (driverId), points DECIMAL, position INTEGER, positionText VARCHAR, wins INTEGER);

--CREATE TABLE constructors (constructorId INTEGER PRIMARY KEY, constructorRef varchar, name varchar, nationality varchar, url varchar);

--CREATE TABLE results (resultId  INTEGER PRIMARY KEY, raceId INTEGER REFERENCES races (raceId), driverId INTEGER REFERENCES drivers (driverId), constructorId INTEGER REFERENCES constructors (constructorId), number INTEGER, grid INTEGER, position INTEGER, positionText VARCHAR, positionOrder INTEGER, points DECIMAL, laps INTEGER, time VARCHAR, milliseconds INTEGER, fastestLap VARCHAR, rank INTEGER, fastestLapTime varchar, fastestLapSpeed varchar, statusId INTEGER);

--CREATE TABLE constructor_standings (constructorStandingsId INTEGER PRIMARY KEY, raceId INTEGER REFERENCES races (raceId), constructorId INTEGER REFERENCES constructors (constructorId), points DECIMAL, position INTEGER, positionText VARCHAR, wins INTEGER);

--CREATE TABLE constructor_results (constructorResultsId INTEGER PRIMARY KEY, raceId INTEGER REFERENCES races (raceId), constructorId INTEGER REFERENCES constructors (constructorId), points DECIMAL, status VARCHAR);

--CREATE TABLE laptimes (raceId INTEGER REFERENCES races (raceId), driverId INTEGER REFERENCES drivers (driverId), lap INTEGER, position INTEGER, time VARCHAR, milliseconds INTEGER);

--CREATE TABLE pitstops (raceId INTEGER REFERENCES races (raceId), driverId INTEGER REFERENCES drivers (driverId), stop INTEGER, lap INTEGER, time VARCHAR, duration interval, milliseconds INTEGER);

-- CREATE TABLE qualifying (qualifyId INTEGER PRIMARY KEY, raceId INTEGER REFERENCES races (raceId), driverId INTEGER REFERENCES drivers (driverId), constructorId INTEGER REFERENCES constructors (constructorId), number INTEGER, position INTEGER, q1 VARCHAR, q2 VARCHAR, q3 VARCHAR);

-- CREATE TABLE seasons (year INTEGER, url VARCHAR);

-- CREATE TABLE status (statusId INTEGER PRIMARY KEY, status VARCHAR);

\copy circuits from 'path_to_csv/hw_db/csv_sqlite/circuits.csv' delimiter ',' csv header;
\copy constructors from 'path_to_csv/hw_db/csv_sqlite/constructors.csv' delimiter ',' csv header;
\copy drivers from 'path_to_csv/hw_db/csv_sqlite/drivers.csv' delimiter ',' csv header;
\copy races from 'path_to_csv/hw_db/csv_sqlite/races.csv' delimiter ',' csv header;
\copy constructor_results from 'path_to_csv/hw_db/csv_sqlite/constructor_results.csv' delimiter ',' csv header;
\copy constructor_standings from 'path_to_csv/hw_db/csv_sqlite/constructor_standings.csv' delimiter ',' csv header;
\copy driver_standings from 'path_to_csv/hw_db/csv_sqlite/driver_standings.csv' delimiter ',' csv header;
\copy laptimes from 'path_to_csv/hw_db/csv_sqlite/laptimes.csv' delimiter ',' csv header;
\copy pitstops from 'path_to_csv/hw_db/csv_sqlite/pitstops.csv' delimiter ',' csv header;
\copy qualifying from 'path_to_csv/hw_db/csv_sqlite/qualifying.csv' delimiter ',' csv header;
\copy results from 'path_to_csv/hw_db/csv_sqlite/results.csv' delimiter ',' csv header;
\copy seasons from 'path_to_csv/hw_db/csv_sqlite/seasons.csv' delimiter ',' csv header;
\copy status from 'path_to_csv/hw_db/csv_sqlite/status.csv' delimiter ',' csv header;

-- rollback
commit;


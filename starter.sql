--Select airport code for airports LIKE 'John F Kennedy' or 'De Gaulle'.
SELECT iata_faa
  FROM airports
 WHERE name
  LIKE 'John F Kennedy%' 
    OR name 
  LIKE '%De%Gaulle%';
--> CDG
--> JFK


--Select all of the flights originating from 'JFK' AND going to 'CDG'.
SELECT * 
  FROM routes
 WHERE origin_code = 'JFK'
   AND dest_code = 'CDG';
--> 
--  airline_code | airline_id | origin_code | origin_id | dest_code | dest_id | codeshare | stops |    equipment
-- --------------+------------+-------------+-----------+-----------+---------+-----------+-------+-----------------
--  AA           |         24 | JFK         |      3797 | CDG       |    1382 |           |     0 | 763 757
--  AF           |        137 | JFK         |      3797 | CDG       |    1382 |           |     0 | 332 772 388 343
--  AY           |       2350 | JFK         |      3797 | CDG       |    1382 |           |     0 | 763 757
--  AZ           |        596 | JFK         |      3797 | CDG       |    1382 | Y         |     0 | 332 388 772 343
--  BA           |       1355 | JFK         |      3797 | CDG       |    1382 | Y         |     0 | 763 757
--  DL           |       2009 | JFK         |      3797 | CDG       |    1382 |           |     0 | 332 772 388 343
--  EY           |       2222 | JFK         |      3797 | CDG       |    1382 | Y         |     0 | 763 757
--  IB           |       2822 | JFK         |      3797 | CDG       |    1382 | Y         |     0 | 763 757
--  QR           |       4091 | JFK         |      3797 | CDG       |    1382 | Y         |     0 | 757
--  SE           |       5479 | JFK         |      3797 | CDG       |    1382 |           |     0 | 763 332
--  US           |       5265 | JFK         |      3797 | CDG       |    1382 |           |     0 | 763 757

--Find out the NUMBER of airports in Canada.
-- SELECT COUNT(
--   SELECT * FROM airports WHERE country = 'Canada'
-- ) AS CA;

SELECT COUNT(*) 
  FROM airports 
 WHERE country = 'Canada';

--Select airport names IN Algeria, Ghana, and Ethiopia. Order the results by country.
SELECT name, country 
  FROM airports 
 WHERE country = 'Algeria' 
    OR country = 'Ghana' 
    OR country = 'Ethiopia' 
 ORDER BY country;

--Select all of the airports from which 'Germania' Airlines flies.
SELECT airlines.name AS airlines, routes.origin_code AS airport_code, airports.name AS airport_name
  FROM airlines
  JOIN routes
    ON airlines.id = routes.airline_id
  JOIN airports
    ON airports.iata_faa = routes.origin_code
 WHERE airlines.name = 'Germania'
 GROUP BY airport_code, airlines, airport_name;

/*
                              Table "public.airlines"
  Column  |          Type          | Collation | Nullable |         Default
----------+------------------------+-----------+----------+-------------------------
 id       | integer                |           |          |
 name     | character varying(255) |           |          | NULL::character varying
 alias    | character varying(255) |           |          | NULL::character varying
 iata     | character varying(255) |           |          | NULL::character varying
 icao     | character varying(255) |           |          | NULL::character varying
 callsign | character varying(255) |           |          | NULL::character varying
 country  | character varying(255) |           |          | NULL::character varying
 active   | character varying(255) |           |          | NULL::character varying

                                Table "public.airports"
   Column   |          Type          | Collation | Nullable |         Default
------------+------------------------+-----------+----------+-------------------------
 id         | integer                |           |          |
 name       | character varying(255) |           |          | NULL::character varying
 city       | character varying(255) |           |          | NULL::character varying
 country    | character varying(255) |           |          | NULL::character varying
 iata_faa   | character varying(255) |           |          | NULL::character varying
 icao       | character varying(255) |           |          | NULL::character varying
 latitude   | character varying(255) |           |          | NULL::character varying
 longitude  | character varying(255) |           |          | NULL::character varying
 altitude   | character varying(255) |           |          | NULL::character varying
 utc_offset | character varying(255) |           |          | NULL::character varying
 dst        | character varying(255) |           |          | NULL::character varying
 tz         | character varying(255) |           |          | NULL::character varying

                                  Table "public.routes"
    Column    |          Type          | Collation | Nullable |         Default
--------------+------------------------+-----------+----------+-------------------------
 airline_code | character varying(255) |           |          | NULL::character varying
 airline_id   | integer                |           |          |
 origin_code  | character varying(255) |           |          | NULL::character varying
 origin_id    | integer                |           |          |
 dest_code    | character varying(255) |           |          | NULL::character varying
 dest_id      | integer                |           |          |
 codeshare    | character varying(255) |           |          | NULL::character varying
 stops        | integer                |           |          |
 equipment    | character varying(255) |           |          | NULL::character varying
 */
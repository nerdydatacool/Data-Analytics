CREATE DATBASE Python;

CREATE TABLE IF NOT EXISTS subject_info (
    Age DOUBLE PRECISION NOT NULL,
    Weight DOUBLE PRECISION NOT NULL,
    Height DOUBLE PRECISION NOT NULL,
    Humidity DOUBLE PRECISION,
    Temperature DOUBLE PRECISION,
    Sex INTEGER NOT NULL,
    ID INTEGER NOT NULL,
    ID_test TEXT NOT NULL
);

SELECT * FROM subject_info;

--to load data from your local csv file to postgres use below query
COPY subject_info
FROM 'C:\Swati\study\Python\Python_Hackathon2025\Datasets\subject_info.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM subject_info;

/* Q 33: Connect to database using PostgreSQL and increase the temperature 2 degrees for participant with maximum humidity and display the result*/
select max(Humidity),Temperature
from subject_info
Group by Temperature
order by Temperature,max(Humidity);

update subject_info
set Temperature = Temperature + 2
where Humidity in (
	select max(Humidity)
	from subject_info
	where Humidity is not NULL
	Group by Temperature
	
)








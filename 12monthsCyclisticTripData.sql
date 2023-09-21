--Create temp table for union of aug and sep 2022 data
CREATE TABLE #aug_sep2022(
ride_id varchar(50),
member_casual varchar(50),
ride_length time(0),
day_of_week int)

INSERT INTO #aug_sep2022
SELECT ride_id, member_casual, CAST(ride_length as time(0)) ride_length, day_of_weeek
FROM CaseStudy..Sep2022 sep
UNION 
SELECT ride_id, member_casual, CAST(ride_length as time(0)) ride_length, day_of_week
FROM CaseStudy..Aug2022 aug


---CREATE store procedure for 12 months data (union monthly data)
CREATE PROCEDURE TwelveMonthsBikingData
AS
SELECT ride_id, member_casual, CAST(ride_length as time(0)) ride_length, 
CASE WHEN day_of_week = 1 THEN 'Sunday'
	 WHEN day_of_week = 2 THEN 'Monday'
	 WHEN day_of_week = 3 THEN 'Tuesday'
	 WHEN day_of_week = 4 THEN 'Wednesday'
	 WHEN day_of_week = 5 THEN 'Thursday'
	 WHEN day_of_week = 6 THEN 'Friday'
	 ELSE 'Saturday'
END
FROM CaseStudy..Jul2022 
UNION 
SELECT ride_id, member_casual, CAST(ride_length as time(0)) ride_length,
CASE WHEN day_of_week = 1 THEN 'Sunday'
	 WHEN day_of_week = 2 THEN 'Monday'
	 WHEN day_of_week = 3 THEN 'Tuesday'
	 WHEN day_of_week = 4 THEN 'Wednesday'
	 WHEN day_of_week = 5 THEN 'Thursday'
	 WHEN day_of_week = 6 THEN 'Friday'
	 ELSE 'Saturday'
END
FROM CaseStudy..Aug2022 
UNION 
SELECT ride_id, member_casual, CAST(ride_length as time(0)) ride_length,
CASE WHEN day_of_weeek = 1 THEN 'Sunday'
	 WHEN day_of_weeek = 2 THEN 'Monday'
	 WHEN day_of_weeek = 3 THEN 'Tuesday'
	 WHEN day_of_weeek = 4 THEN 'Wednesday'
	 WHEN day_of_weeek = 5 THEN 'Thursday'
	 WHEN day_of_weeek = 6 THEN 'Friday'
	 ELSE 'Saturday'
END
FROM CaseStudy..Sep2022
UNION 
SELECT ride_id, member_casual, CAST(ride_length as time(0)) ride_length,
CASE WHEN day_of_week = 1 THEN 'Sunday'
	 WHEN day_of_week = 2 THEN 'Monday'
	 WHEN day_of_week = 3 THEN 'Tuesday'
	 WHEN day_of_week = 4 THEN 'Wednesday'
	 WHEN day_of_week = 5 THEN 'Thursday'
	 WHEN day_of_week = 6 THEN 'Friday'
	 ELSE 'Saturday'
END
FROM CaseStudy..Oct2022
UNION 
SELECT ride_id, member_casual, CAST(ride_length as time(0)) ride_length,
CASE WHEN day_of_week = 1 THEN 'Sunday'
	 WHEN day_of_week = 2 THEN 'Monday'
	 WHEN day_of_week = 3 THEN 'Tuesday'
	 WHEN day_of_week = 4 THEN 'Wednesday'
	 WHEN day_of_week = 5 THEN 'Thursday'
	 WHEN day_of_week = 6 THEN 'Friday'
	 ELSE 'Saturday'
END
FROM CaseStudy..Nov2022
UNION 
SELECT ride_id, member_casual, CAST(ride_length as time(0)) ride_length,
CASE WHEN day_of_week = 1 THEN 'Sunday'
	 WHEN day_of_week = 2 THEN 'Monday'
	 WHEN day_of_week = 3 THEN 'Tuesday'
	 WHEN day_of_week = 4 THEN 'Wednesday'
	 WHEN day_of_week = 5 THEN 'Thursday'
	 WHEN day_of_week = 6 THEN 'Friday'
	 ELSE 'Saturday'
END
FROM CaseStudy..Dec2022
UNION 
SELECT ride_id, member_casual, CAST(ride_length as time(0)) ride_length,
CASE WHEN day_of_week = 1 THEN 'Sunday'
	 WHEN day_of_week = 2 THEN 'Monday'
	 WHEN day_of_week = 3 THEN 'Tuesday'
	 WHEN day_of_week = 4 THEN 'Wednesday'
	 WHEN day_of_week = 5 THEN 'Thursday'
	 WHEN day_of_week = 6 THEN 'Friday'
	 ELSE 'Saturday'
END
FROM CaseStudy..Jan2023
UNION 
SELECT ride_id, member_casual, CAST(ride_length as time(0)) ride_length,
CASE WHEN day_of_week = 1 THEN 'Sunday'
	 WHEN day_of_week = 2 THEN 'Monday'
	 WHEN day_of_week = 3 THEN 'Tuesday'
	 WHEN day_of_week = 4 THEN 'Wednesday'
	 WHEN day_of_week = 5 THEN 'Thursday'
	 WHEN day_of_week = 6 THEN 'Friday'
	 ELSE 'Saturday'
END
FROM CaseStudy..Feb2023
UNION 
SELECT ride_id, member_casual, CAST(ride_length as time(0)) ride_length,
CASE WHEN day_of_week = 1 THEN 'Sunday'
	 WHEN day_of_week = 2 THEN 'Monday'
	 WHEN day_of_week = 3 THEN 'Tuesday'
	 WHEN day_of_week = 4 THEN 'Wednesday'
	 WHEN day_of_week = 5 THEN 'Thursday'
	 WHEN day_of_week = 6 THEN 'Friday'
	 ELSE 'Saturday'
END
FROM CaseStudy..Mar2023
UNION 
SELECT ride_id, member_casual, CAST(ride_length as time(0)) ride_length,
CASE WHEN day_of_week = 1 THEN 'Sunday'
	 WHEN day_of_week = 2 THEN 'Monday'
	 WHEN day_of_week = 3 THEN 'Tuesday'
	 WHEN day_of_week = 4 THEN 'Wednesday'
	 WHEN day_of_week = 5 THEN 'Thursday'
	 WHEN day_of_week = 6 THEN 'Friday'
	 ELSE 'Saturday'
END
FROM CaseStudy..Apr2023
UNION 
SELECT ride_id, member_casual, CAST(ride_length as time(0)) ride_length,
CASE WHEN day_of_week = 1 THEN 'Sunday'
	 WHEN day_of_week = 2 THEN 'Monday'
	 WHEN day_of_week = 3 THEN 'Tuesday'
	 WHEN day_of_week = 4 THEN 'Wednesday'
	 WHEN day_of_week = 5 THEN 'Thursday'
	 WHEN day_of_week = 6 THEN 'Friday'
	 ELSE 'Saturday'
END
FROM CaseStudy..May2023
UNION 
SELECT ride_id, member_casual, CAST(ride_length as time(0)) ride_length,
CASE WHEN day_of_week = 1 THEN 'Sunday'
	 WHEN day_of_week = 2 THEN 'Monday'
	 WHEN day_of_week = 3 THEN 'Tuesday'
	 WHEN day_of_week = 4 THEN 'Wednesday'
	 WHEN day_of_week = 5 THEN 'Thursday'
	 WHEN day_of_week = 6 THEN 'Friday'
	 ELSE 'Saturday'
END
FROM CaseStudy..Jun2023

EXEC TwelveMonthsBikingData


---Finding Avg_ride_length of riders for Sept 
SELECT member_casual, COUNT(member_casual) Total_Riders, CAST(CAST(AVG(CAST(ride_length AS FLOAT)) AS DATETIME) as time(0)) AVG_ride_length
FROM CaseStudy..Sep2022
GROUP BY member_casual


--Counting total riders for each day
SELECT DISTINCT(day_of_weeek), COUNT(member_casual) Total_Riders
FROM CaseStudy..Sep2022
GROUP BY day_of_weeek


---Finding casual and member riders for each day
SELECT member_casual, 
CASE WHEN day_of_weeek = 1 THEN 'Sunday'
	 WHEN day_of_weeek = 2 THEN 'Monday'
	 WHEN day_of_weeek = 3 THEN 'Tuesday'
	 WHEN day_of_weeek = 4 THEN 'Wednesday'
	 WHEN day_of_weeek = 5 THEN 'Thursday'
	 WHEN day_of_weeek = 6 THEN 'Friday'
	 ELSE 'Saturday'
END as DAYS, COUNT(member_casual) Total_Riders
FROM CaseStudy..Sep2022
GROUP BY day_of_weeek, member_casual
ORDER BY member_casual, day_of_weeek


---Finding casual and member riders of Avg_ride_length for each day
SELECT member_casual, 
CASE WHEN day_of_weeek = 1 THEN 'Sunday'
	 WHEN day_of_weeek = 2 THEN 'Monday'
	 WHEN day_of_weeek = 3 THEN 'Tuesday'
	 WHEN day_of_weeek = 4 THEN 'Wednesday'
	 WHEN day_of_weeek = 5 THEN 'Thursday'
	 WHEN day_of_weeek = 6 THEN 'Friday'
	 ELSE 'Saturday'
END as DAYS, COUNT(member_casual) Total_Riders, CAST(CAST(AVG(CAST(ride_length AS FLOAT)) AS DATETIME) as time(0)) AVG_ride_length
FROM CaseStudy..Sep2022
GROUP BY day_of_weeek, member_casual
ORDER BY member_casual, day_of_weeek


---Combine 12 months data to a temp talbe and Find casual and member riders of Avg_ride_length for each day
DROP TABLE IF EXISTS #twelve_months_biking_data
GO
CREATE TABLE #twelve_months_biking_data(
ride_id varchar(50),
member_casual varchar(50),
ride_length float,
day_of_week int)

INSERT INTO #twelve_months_biking_data
SELECT ride_id, member_casual, CAST(ride_length as float), day_of_week
FROM CaseStudy..Jul2022 
UNION 
SELECT ride_id, member_casual, CAST(ride_length as float), day_of_week
FROM CaseStudy..Aug2022 
UNION 
SELECT ride_id, member_casual, CAST(ride_length as float), day_of_weeek
FROM CaseStudy..Sep2022
UNION 
SELECT ride_id, member_casual, CAST(ride_length as float), day_of_week
FROM CaseStudy..Oct2022
UNION 
SELECT ride_id, member_casual, CAST(ride_length as float), day_of_week
FROM CaseStudy..Nov2022
UNION 
SELECT ride_id, member_casual, CAST(ride_length as float), day_of_week
FROM CaseStudy..Dec2022
UNION 
SELECT ride_id, member_casual, CAST(ride_length as float), day_of_week
FROM CaseStudy..Jan2023
UNION 
SELECT ride_id, member_casual, CAST(ride_length as float), day_of_week
FROM CaseStudy..Feb2023
UNION 
SELECT ride_id, member_casual, CAST(ride_length as float), day_of_week
FROM CaseStudy..Mar2023
UNION 
SELECT ride_id, member_casual, CAST(ride_length as float), day_of_week
FROM CaseStudy..Apr2023
UNION 
SELECT ride_id, member_casual, CAST(ride_length as float), day_of_week
FROM CaseStudy..May2023
UNION 
SELECT ride_id, member_casual, CAST(ride_length as float), day_of_week
FROM CaseStudy..Jun2023


SELECT member_casual, 
CASE WHEN day_of_week = 1 THEN 'Sunday'
	 WHEN day_of_week = 2 THEN 'Monday'
	 WHEN day_of_week = 3 THEN 'Tuesday'
	 WHEN day_of_week = 4 THEN 'Wednesday'
	 WHEN day_of_week = 5 THEN 'Thursday'
	 WHEN day_of_week = 6 THEN 'Friday'
	 ELSE 'Saturday'
END as DAYS, COUNT(member_casual) Total_Riders, CAST(CAST(AVG(ride_length ) AS DATETIME) as time(0)) AVG_ride_length
FROM #twelve_months_biking_data
GROUP BY day_of_week, member_casual
ORDER BY member_casual, day_of_week


#2 Growth of LetsMeet over the years based on number of members who joined each year

SELECT
	member_id,
    YEAR(MIN(joined)) AS join_year
FROM grp_member
GROUP BY member_id;

SELECT
	join_year,
    COUNT(member_id) AS total_members
FROM (
		SELECT
			member_id,
			YEAR(MIN(joined)) AS join_year
		FROM grp_member
		GROUP BY member_id
	 ) AS yoy
GROUP BY join_year
ORDER BY join_year DESC;

# Adjusting grp_member table using DML to rename smaller cities to the name of their larger urban areas
SELECT
	*
FROM grp_member;

SET SQL_SAFE_UPDATES = 0;

UPDATE grp_member
	SET city = 'Chicago'
WHERE city IN ('East Chicago', 'West Chicago', 'North Chicago', 'Chicago Heights', 'Chicago Ridge', 'Chicago');

UPDATE grp_member
	SET city = 'San Francisco'
WHERE city IN ('San Francisco', 'South San Francisco');

UPDATE grp_member
	SET city = 'New York'
WHERE city IN ('New York', 'West New York');

SET SQL_SAFE_UPDATES = 1;

-- Chicago
SELECT
	join_year,
    COUNT(member_id) AS total_members
FROM (
		SELECT
			member_id,
			YEAR(MIN(joined)) AS join_year
		FROM grp_member
        WHERE city = 'Chicago'
		GROUP BY member_id
	 ) AS yoy
GROUP BY join_year
ORDER BY join_year DESC;
  
-- San Francisco
SELECT
	join_year,
    COUNT(member_id) AS total_members
FROM (
		SELECT
			member_id,
			YEAR(MIN(joined)) AS join_year
		FROM grp_member
        WHERE city = 'San Francisco'
		GROUP BY member_id
	 ) AS yoy
GROUP BY join_year
ORDER BY join_year DESC;

-- New York
SELECT
	join_year,
    COUNT(member_id) AS total_members
FROM (
		SELECT
			member_id,
			YEAR(MIN(joined)) AS join_year
		FROM grp_member
        WHERE city = 'New York'
		GROUP BY member_id
	 ) AS yoy
GROUP BY join_year
ORDER BY join_year DESC;


# Looking into 2017 as membership seems to slow most
SELECT
	join_year,
    join_month,
    COUNT(member_id) AS total_members
FROM (
		SELECT
			member_id,
			YEAR(MIN(joined)) AS join_year,
            MONTH(MIN(joined)) AS join_month
		FROM grp_member
		GROUP BY member_id
	 ) AS yoy
WHERE join_year = 2017
GROUP BY join_year, join_month
ORDER BY join_month;

/*
Throughout the year for 2017, there is on average of about 900-1000 new members per month. However, we can see that there is a significant decrease in the months of November
with 218 members and December with only 12 members
*/

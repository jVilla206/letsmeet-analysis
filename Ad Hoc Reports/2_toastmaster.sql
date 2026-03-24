# The total number of Toastmasters events on Lets Meet
SELECT
	*
FROM event
WHERE LOWER(event_name) LIKE '%toastmaster%';

# The number of Toastmasters events per city
SELECT
	event_name,
    city
FROM event
LEFT JOIN grp
	ON event.group_id = grp.group_id
LEFT JOIN city
	ON grp.city_id = city.city_id
WHERE LOWER(event_name) LIKE '%toastmaster%';

SELECT
    city,
    COUNT(*) AS toastmaster_events
FROM event
LEFT JOIN grp
	ON event.group_id = grp.group_id
LEFT JOIN city
	ON grp.city_id = city.city_id
WHERE LOWER(event_name) LIKE '%toastmaster%'
GROUP BY city
ORDER BY 2 DESC;
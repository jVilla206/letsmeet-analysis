-- Answer the questions from the Sales team in this file.


-- Active Cities
# 1. What cities have active members?
SELECT
	DISTINCT city
FROM grp_member
WHERE member_status = 'active';
/* San Francisco, New YOrk, Chicago, West New York, West Chicago, South San Francisco, North Chicago, Chicago Heights, East Chicago, and Chicago Ridge are the only cities with active members */

# 2. Are there any cities listed in the city table with no active members? If so, what state are those cities in?
SELECT
	DISTINCT gm.city,
    c.state,
    member_status
FROM grp_member gm
JOIN grp g
	ON gm.group_id = g.group_id
JOIN city c
	ON g.city_id = c.city_id
WHERE member_status != 'active';

/* All 3 LetsMeet major cities New York, San Francisco, and Chicago in their respective states of NY, CA, and IL have cities listed in the city table with no active members.
*It is important to note that there seems to be a data accuracy issue with there being an entry of "New York"
that is linked to the state of "CA", although there is no city named "New York" in California */

-- Groups
# 1. How many groups are currently open, waiting for approval, and/or closed?
SELECT
	join_mode,
    COUNT(group_id) AS total_groups
FROM grp
GROUP BY join_mode;

/* There are 3602 groups that are currently open, 723 groups waiting for approval, and 15 groups that are closed */

-- Categories
# 1. What are the five categories that contain the most groups? What are the five categories that contain the least number of groups?
SELECT
	category_name,
    COUNT(*) AS total_groups
FROM category c
LEFT JOIN grp
	ON c.category_id = grp.category_id
GROUP BY category_name
ORDER BY COUNT(*) DESC
LIMIT 5;

SELECT
	category_name,
    COUNT(*) AS total_groups
FROM category c
LEFT JOIN grp
	ON c.category_id = grp.category_id
GROUP BY category_name
ORDER BY COUNT(*)
LIMIT 5;

/* 
The top five categories that contain the most groups are Tech (911), Career & Business (790), Socializing (320), Health & Wellbeing (218), and Language & Ethnic Identity (166)
The top five categories that contain the least number of groups are Paranoraml (4), Cars & Motorcycles (15), Sci-FI & Fantasy (16), Lifestyle (26), and Hobbies & Crafts (32)
*/

-- Members
# 1. How many members are there?
# 2. What percentage of members are in Chicago?

SELECT
	COUNT(DISTINCT member_id) total_members
FROM grp_member;

SELECT
	(
    SELECT
		COUNT(DISTINCT member_id)
	FROM grp_member
    WHERE city = 'Chicago'
    ) / COUNT(DISTINCT member_id) * 100 AS percentage_of_members_chicago -- Total DISTINCT members of Chicago / Total members overall * 100
FROM grp_member;

/* There are a total of 39,980 members. Out of that total, about 21.19% of members reside in Chicago */

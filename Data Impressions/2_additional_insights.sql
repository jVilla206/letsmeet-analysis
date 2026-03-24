-- Table name
-- Query
-- Multi-line comment containing your question and key insight

# venue_
SELECT
    zip,
    address_1,
    COUNT(*)
FROM venue_
GROUP BY zip
ORDER BY COUNT(*) DESC;


/* 
What zip code has the most venues? What neighborhood is this?

"-1" and "1" have the most venues with 432 and 64 respctively. However, the zip is most likely due to an error with the dataset. The corresponding neighborhoods would be 1550 N. Kingsbury for -1
and 1821 W Hubbard St, ste304 for -1 and 1.
10003 (77 5th Ave) and 10001 (32nd St. @ Broadway) have 3rd and 4th most venues at 35 and 30, respectively. 
*/

# grp
SELECT
	*
FROM grp
WHERE group_name LIKE '%Running%'
ORDER BY members DESC;

SELECT
	group_name,
    members,
	YEAR(current_date) - YEAR(created) AS age_group
FROM grp
WHERE who LIKE '%run%'
ORDER BY age_group DESC;

/*
What is the longest running group on LetsMeet? How many members do they have?

The largest "running" group on LetsMeet is 'The NYC Running, Health, Fitness, and Sports Group!' with 3897 members. This number could be skewed since its members are fully inclusive to
only "runners".

*Below is if "running" meant time lol.
The longest running group would be "Uptown Runners" at 13 years. There are 895 members apart of this group.
*/

# grp_member
SELECT
	*
FROM grp_member
WHERE member_status = 'active'
ORDER BY joined;

SELECT
	member_id,
    member_name,
    COUNT(group_id) AS total_groups
FROM grp_member
GROUP BY member_id
ORDER BY total_groups DESC;

/*
Who was the first LetsMeet member that is still active? What member is a part of the most groups?

The first LetsMet member that is stil active is Christine with member_id 257351, and they joined on 4/14/2003.
Members Steve, Kaushik, Sam, Huang, Lucy, Ana, and Nitin are each apart of 7 groups in total.
*/

# city
SELECT
	*
FROM city
ORDER BY ranking;

/*
What is the ranking column? Is it providing any additional useful information about cities?

We can infer that the ranking column is based on popularity or how a group is rated by its members and the community. However, this is a bit ambiguous and is not obvious.
It does not seem like ranking is correlated with the state, zip, member_count, or distance. It does not seem to provide much useful information about cities. Unless there is a key
with an associated  marker indicating the use of this ranking column. Might be best to remove column unless we can define it.
*/

# event
SELECT
	AVG(duration) AS average_duration_sec
FROM event;

SELECT
	AVG(duration)/60 AS average_duration_min
FROM event;

SELECT
	AVG(duration)/3600 AS average_duration_hr
FROM event;

SELECT
	AVG(yes_rsvp_count)
FROM event;

/*
What is the average duration of all events? In minutes? Hours?
The average duration for all events is 10769 seconds, 179.48 mins, or 2.99 hours.
For all events, on average there are about 3 people in attendance.
*/

# category
SELECT
	category_name,
    COUNT(DISTINCT member_id) AS total_members
FROM category
LEFT JOIN grp
	ON category.category_id = grp.category_id
LEFT JOIN grp_member
	ON grp.group_id = grp_member.group_id
GROUP BY category_name
ORDER BY total_members DESC;

/*
How can you combine the category data with other data to determine the most popular categories based on distinct member_id count?

By utilizing two joins from category --> grp --> grp_member we could determine which categories where the most popular based on distinct member_id count. We are defining "popular" as
the number of distinct members.
Tech would be the most popular categroy with a total distinct count of 11,115 members. This is the only categroy with over 10,000 members as the next highest is Career & Business at
7,911 members, a more than 2,000 member difference.
*/

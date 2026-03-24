# Breakdown of ratings
SELECT
	SUM(CASE WHEN rating BETWEEN 1 AND 1.99 THEN 1 ELSE 0 END) 1_and_2_rating,
	SUM(CASE WHEN rating BETWEEN 2 AND 2.99 THEN 1 ELSE 0 END) 2_and_3_rating,
	SUM(CASE WHEN rating BETWEEN 3 AND 3.99 THEN 1 ELSE 0 END) 3_and_4_rating,
	SUM(CASE WHEN rating BETWEEN 4 AND 4.99 THEN 1 ELSE 0 END) 4_and_5_rating,
	SUM(CASE WHEN rating = 5 THEN 1 ELSE 0 END) 5_rating,
	SUM(CASE WHEN rating = 0 THEN 1 ELSE 0 END) 0_rating
FROM grp;

/* 
* How many groups have 5 star ratings?
 - There are 745 groups with a 5 star rating
*/

SELECT
	SUM(CASE WHEN rating = 5 THEN 1 ELSE 0 END) / SUM(CASE WHEN rating BETWEEN 0 AND 5 THEN 1 ELSE 0 END)*100 AS percent_5_star_ratings
FROM grp;

/*
* Of the groups that have been rated, what percent of groups are rated 5 stars?
 - About 17.17% of groups are rated 5 stars
 
* Is this a reliable measure of the success or popularity of the group?
 - It's first good to clarify what "success" or "popularity" looks like for the marketing team.
 We know 5 stars is the max rating, but is within 4-4.99 still consisdered successful?
 In order to determine popularity, it would be good to also look at the number of members of a group.
*/

SELECT
	group_name,
    members
FROM grp
WHERE rating = 5
ORDER BY members DESC;

/* 
#2 Of the groups that have perfect 5 star ratings, which have the most members?
 - Of the groups with a perfect 5 star rating: (Looking at the top 5 groups with the most members)
   NYC Art Meetup has the most with 9082 members, followed by NYC Local Singles and Professionals Get Togethers with 5776 members, New York Travel Photohgraphy with 4786 members,
   Chicago Young Professionals - Business, Social & Tech Events with 4057 members, and Create and Chat with 2752 members.
*/

-- New York
SELECT
	group_name,
    members,
    city,
    YEAR(created) year_created
FROM grp
LEFT JOIN city
	ON grp.city_id = city.city_id
WHERE rating = 5 AND city = 'New York'
ORDER BY members DESC;

-- Chicago
SELECT
	group_name,
    members,
    city,
    YEAR(created) year_created
FROM grp
LEFT JOIN city
	ON grp.city_id = city.city_id
WHERE rating = 5 AND city = 'Chicago'
ORDER BY members DESC;

-- San Francisco
SELECT
	group_name,
    members,
    city,
    YEAR(created) year_created
FROM grp
LEFT JOIN city
	ON grp.city_id = city.city_id
WHERE rating = 5 AND city = 'San Francisco'
ORDER BY members DESC;

/* 
#3 Including city for each group
*Focus on popularity and diversity of the LetsMeet group community
	- Highly rated
	- Have a significant number of members
    - Are representative of a variety of categories

Guiding Questions and Considerations:
	- Should you only include groups from the most popular categories?
	- What about including only groups from the least represeented categories to try and increase the variety of groups on LetsMeet?
*It would be good to include a variety of groups. New York has more flexibility of showcasing an additional 2 other groups.

-- 3 from New York
	- NYC Art Meetup has a perfect 5 star rating and contains the most members out of all LetsMeet groups with 9082 members. This is more than 3000+ member difference between the
    next biggest group of 5776 members.
    - NYC Local Singles and Professionals Get Togethers also has a 5 star rating, contains the 2nd most members with 5776, and was also created in 2015. This showcases the
    professional side of a group compared to the creative/artistic group in the 1st mentioned group.
    - Create and Chat has a 5 star rating, has 2752 members, and is a younger group that was created more recently in 2017.

-- 1 from Chicago
	- Chicago Young Professionals - Business, Social & Tech Events has a 5 star rating and the most members with 4057. It is one of the older groups created since it was created in
    2012. This was a good option to showcase since it has a diversity of business, social, and tech. It has almost a 2000 member difference from the 2nd group with the
    most members.
    
-- 1 from San Francisco
	- San Francisco - The Machine Learning Conference has a perfect 5 star rating, was created in 2014, and has 2051 members. San Francisco is a global hub for tech, so it would be good
    to showcase this interest. Although Sketch & Design - San Francisco has more members, it's only a 200 member difference and it would be good to show some diversity since we already
    mentioned an art group with NYC Art Meetup.
*/
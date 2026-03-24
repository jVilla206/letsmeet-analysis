-- Summary of Findings
-- Use this file to summarize your findings and make your recommendations where they have been requested.
-- Any recommendations should include the data to support why you are making that recommendation

-- 1. How many Toastmasters events are occurring using LetsMeet for each city of New York, Chicago and San Francisco?
/* 
Chicago hosts the most Toastmasters events using LetsMeet with 986 events, followed by New York with 124 events, and San Francisco with the lowest at 7 events.
*/



-- 2. Is LetsMeet membership leveling off?
/*
	* We decided to include the smaller cities to be apart of their larger urban areas in order to account for discrepancies. We combined smaller cities in Chicago, San Francisco, and
    New York.
	* Looking at YOY member growth. Each city for Chicago, San Francisco, and New York all had a positive YOY growth rate, and began leveling off in 2017. The only city
    that had a negative growth was Chicago in 2017 (from 2395 members --> 2290 members).
	* I decided to investigate further into 2017 and examined the data for 2017 on a month-to-month basis. I found that members were joining consistently at about 900-1000 members per
    month, until the months of November and December. These months saw a drastic reduction in membership growth dropping to 218 members for November (~79.24% reduction from October) and
    12 members for December (94.5% reduction from November)
*/

-- 3. What five groups should the Marketing team feature in their upcoming campaign?
/*
Groups were selected based off the focus on popularity and diversity of the LetsMeet group community and in addition to the criteria below:
	- Highly rated
	- Have a significant number of members
    - Are representative of a variety of categories

3 from New York:
	- NYC Art Meetup has a perfect 5 star rating and contains the most members out of all LetsMeet groups with 9082 members. This is more than a 3000+ member difference between the
    next biggest group of 5776 members.
    - NYC Local Singles and Professionals Get Togethers also has a 5 star rating, contains the 2nd most members with 5776, and was also created in 2015. This showcases the
    professional side of a group compared to the creative/artistic group in the 1st mentioned group.
    - Create and Chat has a 5 star rating, has 2752 members, and is a younger group that was created more recently in 2017.

1 from Chicago:
	- Chicago Young Professionals - Business, Social & Tech Events has a 5 star rating and the most members with 4057. It is one of the older groups created since it was created in
    2012. This was a good option to showcase since it has a diversity of business, social, and tech. It has almost a 2000 member difference from the 2nd group with the
    most members.
    
1 from San Francisco:
	- San Francisco - The Machine Learning Conference has a perfect 5 star rating, was created in 2014, and has 2051 members. San Francisco is a global hub for tech, so it would be good
    to showcase this interest. Although Sketch & Design - San Francisco has more members, it's only a 200 member difference and it would be good to showcase more diversity since we
    already mentioned an art group with NYC Art Meetup.
*/
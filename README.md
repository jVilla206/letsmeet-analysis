# Background
<img width="334" height="72" alt="image" src="https://github.com/user-attachments/assets/df6056b1-d193-41ce-8054-61b0cc3b56ed" />

LetsMeet is an online network for professionals and enthusiasts to meet up in real life with groups that share common interests. People who use LetsMeet find new groups of friends in their city and make lasting connections.

Ad-hoc analysis and database normalization through 3NF were done. Collaboration with the analytics VP of engineering and director of sales. 

# Executive Summary

# Insights

### Overview
* LetsMeet has an average of 732 members per group
* The most members in one group are 23380 members

### Ad-Hoc Requests

<img width="880" height="135" alt="image" src="https://github.com/user-attachments/assets/e1445b54-e4d3-4f77-bcba-03874163d1e3" />

### **How many Toastmasters events are occurring using LetsMeet for each city of New York, Chicago and San Francisco?**
* Chicago hosts the most Toastmasters events using LetsMeet with 986 events, followed by New York with 124 events, and San Francisco with the lowest at 7 events.

### **Is LetsMeet membership leveling off?**
	* We decided to include the smaller cities to be apart of their larger urban areas in order to account for discrepancies. We combined smaller cities in Chicago, San Francisco, and
    New York.
	* Looking at YOY member growth. Each city for Chicago, San Francisco, and New York all had a positive YOY growth rate, and began leveling off in 2017. The only city
    that had a negative growth was Chicago in 2017 (from 2395 members --> 2290 members).
	* I decided to investigate further into 2017 and examined the data for 2017 on a month-to-month basis. I found that members were joining consistently at about 900-1000 members per
    month, until the months of November and December. These months saw a drastic reduction in membership growth dropping to 218 members for November (~79.24% reduction from October) and
    12 members for December (94.5% reduction from November)
    
### **What five groups should the marketing team feature in their upcoming campaign?**

**Criteria for groups:**
  - Are highly rated
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

### Entity Relationship Diagram (ERD)
<img width="789" height="525" alt="image" src="https://github.com/user-attachments/assets/2ffbc1a4-e600-4407-91cd-dafbcb0fc36d" />

###  Tables in the Database
<img width="350" height="400" alt="image" src="https://github.com/user-attachments/assets/a4eed912-d53e-454f-aac9-62890bd9f400" />




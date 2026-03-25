# Step 2: Elimnate Redundant Columns
-- grp_member (1)
SELECT
	*
FROM grp_member;

ALTER TABLE grp_member
DROP COLUMN country;

/*
Removing column country because it is redundant. LetsMeet only operates in one country, so it would be universal for each member.
*/

-- venue_ (2)
SELECT
	*
FROM venue_;

ALTER TABLE venue_
DROP COLUMN `RAND()`;

/*
Dropping the column `Rand()` because this function is uniformative and does not provide any useful information for this table. It just generates a random number without context.
*/

-- city (3)
SELECT
	*
FROM city;

ALTER TABLE city
DROP COLUMN localized_country_name,
DROP COLUMN country;

/*
Dropped columns locaized_country_name and country because LetsMeet only operates in the USA, so have this information is redundant.
*/

-- event (4)
SELECT
	*
FROM event;

ALTER TABLE event
DROP COLUMN utc_offset,
DROP COLUMN why,
DROP COLUMN headcount,
DROP COLUMN visibility;

/*
For the table event, columns utc_offset, why, headcount, and visibility do not offer any useful information/value to the event table data. It is uninformative.
*/

-- category (5)
SELECT
	*
FROM category;

ALTER TABLE category 
DROP COLUMN shortname,
DROP COLUMN sort_name;

/*
Dropped the columns shortname and sort_name in the category table because they both have redundant information with the category_name column.
*/

# Step 3: Split grp_member Table
DESCRIBE grp_member;

SELECT
	*
FROM grp_member;

/* 
No PRIMARY KEY means table is not normalized
Will need to split grp_member into two tables: one that includes information about the members and one that incldues the groups they are a part of.

*/
-- Creating new table called group_sign_ups
# Distinct was not working, had to group by 'group_id' in order remove duplicates
CREATE TABLE group_sign_ups AS
SELECT
	DISTINCT group_id,
    member_id,
    joined
FROM grp_member
GROUP BY group_id;

-- Creating a new table called members
CREATE TABLE members
SELECT
	DISTINCT member_id,
	member_name,
    city,
    hometown,
    member_status
FROM grp_member;

-- C.
ALTER TABLE group_sign_ups
ADD PRIMARY KEY(group_id);

ALTER TABLE members
ADD PRIMARY KEY(member_id);

-- D.
ALTER TABLE group_sign_ups
ADD FOREIGN KEY (member_id) REFERENCES members(member_id);

-- E.
ALTER TABLE group_sign_ups
ADD FOREIGN KEY(group_id) REFERENCES grp(group_id);

-- F.
DROP TABLE grp_member;

# Step 4: Create a New ERD
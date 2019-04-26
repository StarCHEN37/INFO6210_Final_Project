use mydb;

SELECT comments
FROM comments
WHERE musician_screen_name = 'jasonderulo';

SELECT musician_screen_name, SUM(post_favorite_count) AS total_favorite, SUM(post_retweet_count)AS total_retweet 
FROM musician_posts 
WHERE musician_screen_name = 'jasonderulo';


SELECT musician_screen_name, SUM(post_favorite_count) AS total_favorite, SUM(post_retweet_count)AS total_retweet 
FROM musician_posts 
#WHERE musician_screen_name = 'jasonderulo'
GROUP BY musician_screen_name
LIMIT 1;

SELECT post_text
FROM music_lover_tweet 
WHERE post_mentions LIKE '%(
SELECT musician_name
FROM musician_tweet_info
WHERE musician_id = 28076276)%';


SELECT post_text
FROM musician_posts
WHERE post_hashtags IN (
SELECT post_hashtags
FROM musician_posts
WHERE musician_screen_name = 'jasonderulo'
AND post_hashtags NOT IN ('#'))
AND musician_screen_name NOT IN ('jasonderulo');
 
SELECT musician_screen_name
FROM musician_posts
WHERE post_hashtags IN (
SELECT post_hashtags
FROM musician_posts
WHERE musician_screen_name = 'jasonderulo'
AND post_hashtags NOT IN ('#'))
AND musician_screen_name NOT IN ('jasonderulo');

SELECT musician_name, musician_followers_count
FROM musician_tweet_info
WHERE musician_description LIKE '%music%'
ORDER BY musician_followers_count DESC;


SELECT post_hashtags,COUNT(*)
FROM musician_posts
WHERE post_hashtags NOT IN ('#')
GROUP BY post_hashtags
ORDER BY COUNT(*) DESC
LIMIT 1;


SELECT post_hashtags
FROM musician_posts
WHERE post_favorite_count = (
SELECT MAX(post_favorite_count)
FROM musician_posts
WHERE post_hashtags NOT IN ('#'));


SELECT musician_name, musician_followers_count
FROM musician_tweet_info
WHERE musician_followers_count >=(
SELECT musician_followers_count
FROM musician_tweet_info
WHERE musician_screen_name = 'jasonderulo');


SELECT posts_created_at, post_favorite_count, post_retweet_count
FROM musician_posts
ORDER BY post_favorite_count DESC, post_retweet_count DESC
LIMIT 1;

SELECT musician_name, musician_followers_count, musician_friends_count, (musician_followers_count + musician_friends_count) AS reach
FROM musician_tweet_info
WHERE musician_screen_name = 'jasonderulo';

SELECT * 
FROM music_lover_tweet
WHERE post_text LIKE ('%jason derulo%');


DROP VIEW Columbia_Records_Fans,Warnerbros_Records_Fans,Good_Music_Fans,Good_Music_Fans_2, Good_Music_Fans_3;

CREATE VIEW Columbia_Records_Fans_old AS
SELECT SUM(musician_followers_count) AS company_fans
FROM musician_tweet_info
WHERE musician_name IN (
SELECT musician_name
FROM musician
WHERE company_name = 'Columbia Records');

CREATE VIEW Warnerbros_Records_Fans_old AS
SELECT SUM(musician_followers_count) AS company_fans
FROM musician_tweet_info
WHERE musician_name IN (
SELECT musician_name
FROM musician
WHERE company_name = 'Warnerbros Records');

CREATE VIEW Good_Music_Fans_old AS
SELECT SUM(musician_followers_count) AS company_fans
FROM musician_tweet_info
WHERE musician_name IN (
SELECT musician_name
FROM musician
WHERE company_name = 'Good Music');

CREATE VIEW Columbia_Records_Fans AS
SELECT SUM(musician_followers_count) AS company_fans, company_name
FROM musician_tweet_info AS aa JOIN musician AS bb ON
aa.musician_name = bb.musician_name
AND bb.company_name = 'Columbia Records';

CREATE VIEW Warnerbros_Records_Fans AS
SELECT SUM(musician_followers_count) AS company_fans, company_name
FROM musician_tweet_info AS aa JOIN musician AS bb ON
aa.musician_name = bb.musician_name
AND bb.company_name = 'Warnerbros Records';

CREATE VIEW Good_Music_Fans AS
SELECT SUM(musician_followers_count) AS company_fans, company_name
FROM musician_tweet_info AS aa JOIN musician AS bb ON
aa.musician_name = bb.musician_name
AND bb.company_name = 'Good Music';


SELECT * 
FROM Columbia_Records_Fans,Warnerbros_Records_Fans,Good_Music_Fans;

SELECT MAX(b.company_fans),b.company_name
FROM(
SELECT * 
FROM Good_Music_Fans
UNION
SELECT * FROM Columbia_Records_Fans
UNION 
SELECT * FROM Warnerbros_Records_Fans)As b;

CREATE VIEW joined_company_fans AS
SELECT * 
FROM Good_Music_Fans
UNION
SELECT * FROM Columbia_Records_Fans
UNION 
SELECT * FROM Warnerbros_Records_Fans;


SELECT *
FROM joined_company_fans
ORDER BY company_fans DESC
LIMIT 1;





SELECT DISTINCT(
SELECT SUM(musician_followers_count)
FROM musician_tweet_info
WHERE musician_name IN (
SELECT musician_name
FROM musician
WHERE company_name = 'Columbia Records')),

(SELECT SUM(musician_followers_count)
FROM musician_tweet_info
WHERE musician_name IN (
SELECT musician_name
FROM musician
WHERE company_name = 'Warnerbros Records')),

(SELECT SUM(musician_followers_count)
FROM musician_tweet_info
WHERE musician_name IN (
SELECT musician_name
FROM musician
WHERE company_name = 'Good Music'))
FROM music_company;


SELECT sum(duration_time)
FROM music
WHERE musician = 'Faith Hill';

SELECT COUNT(musician_name),company_name
FROM music AS a JOIN musician AS b ON
a.musician = b.musician_name
WHERE b.company_name = 'Good Music'
UNION 
SELECT COUNT(musician_name),company_name
FROM music AS a JOIN musician AS b ON
a.musician = b.musician_name
WHERE b.company_name = 'Columbia Records'
UNION 
SELECT COUNT(musician_name),company_name
FROM music AS a JOIN musician AS b ON
a.musician = b.musician_name
WHERE b.company_name = 'Warnerbros Records';

CREATE VIEW Columbia_Records_Music AS 
SELECT music_name, musician
FROM music AS a JOIN musician AS b ON
a.musician = b.musician_name
WHERE b.company_name = 'Columbia Records';

CREATE VIEW Warnerbros_Records_Music AS 
SELECT music_name, musician
FROM music AS a JOIN musician AS b ON
a.musician = b.musician_name
WHERE b.company_name = 'Warnerbros Records';

CREATE VIEW Good_Music_Music AS 
SELECT music_name, musician
FROM music AS a JOIN musician AS b ON
a.musician = b.musician_name
WHERE b.company_name = 'Good Music';

SELECT *
FROM Columbia_Records_Music;

SELECT *
FROM Warnerbros_Records_Music;

SELECT *
FROM Good_Music_Music;


INSERT INTO mis_spelling(hashtags) VALUE('DX');
INSERT INTO mis_spelling(hashtags) VALUE('DZ');
INSERT INTO mis_spelling(hashtags) VALUE('DV');
INSERT INTO mis_spelling(hashtags) VALUE('DB');


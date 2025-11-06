select * from webtoon.data;

update data
SET genre = "SCI-FI" 
WHERE genre = "SF";

select * from webtoon.data
where title is null;

/*to make a copy of the data for backup*/

create table data_copy like webtoon.data;

insert into data_copy select * from webtoon.data;

select * from data_copy;

-- data analysis by sql

-- books by genre

select genre, count(*) from
webtoon.data
group by genre;

-- checking if daily pass have hands in total likes given by users. 
-- same for subscribers, ratings, views

select daily_pass, sum(likes) total_likes, sum(views) total_views, sum(subscribers) total_subscribers from webtoon.data
group by daily_pass;

-- genre vs avg ratings

select genre, avg(rating) avg_rating from webtoon.data
group by genre
order by avg_rating desc;

-- correlation between update day and views and rating

select weekdays, sum(views) total_views, avg(views) avg_views
from webtoon.data
group by weekdays
order by total_views desc,
avg_views desc;

-- webtoon with more than 1 millions views also the top webtoons

select title, views
from webtoon.data
where views >=10000000
order by views desc;

select count(*)
from webtoon.data
where views >= 1000000; -- total number of webbtoons with 1M and more 

-- avg views per day

select avg(views), weekdays
from webtoon.data
group by weekdays;

-- genre with more than 5 webtoon

select genre, count(title) total_webtoons
from webtoon.data
group by genre
having total_webtoons >=5;











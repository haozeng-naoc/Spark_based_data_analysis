use pyspark;
select * from games limit (5);
/*1.下载次数最多的游戏的好评和差评top10（新加列 'owners clean'）*/
select name, Positive, Negative from games order by owners_clean DESC limit (10);

/*2.好评率（好评数/评价总数）限制评价总数1000以上的游戏*/
SELECT name, rate from(
                          select name, Positive/(Negative+Positive) as rate from games WHERE owners_clean > 100000)
order by rate desc limit(10);

/*3.Mac、Win、Linux的平均游戏价格*/
select Win_price, Mac_price, Linux_price from
                                             (SELECT avg(price) as Win_price FROM games where Windows = "True") as windows_table,
                                             (SELECT avg(price) as Mac_price FROM games where Mac = "True") as mac_table,
                                             (SELECT avg(price) as Linux_price FROM games where Linux = "True") as linux_table;

/*4.DLC数top5的开发者*/
SELECT Developers, sum_DLC_count from(
                                         select Developers, sum(DLC_count) as sum_DLC_count FROM games group by Developers)
ORDER BY sum_DLC_count desc limit(10);

/*5.有支持服务的游戏和无支持服务的游戏平均下载量*/
select have_support_time, no_support_time from
                                              (SELECT AVG(owners_clean) as have_support_time from games where Support_email is not NULL) as have_support_table,
                                              (SELECT AVG(owners_clean) as no_support_time from games where Support_email="no Support email available") as no_support_table;






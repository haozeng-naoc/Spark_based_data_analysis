create database pyspark;
use pyspark;

create table games(
                      AppID string,
                      Name string,
                      Release_date string,
                      Estimated_owners string,
                      Peak_CCU string,
                      Required_age int,
                      Price int,
                      DLC_count int,
                      About_the_game string,
                      Supported_languages array<String>,
                      Full_audio_languages array<String>,
                      Header_image string,
                      Support_email string,
                      Windows string,
                      Mac string,
                      Linux string,
                      Metacritic_score int,
                      User_score int,
                      Positive int,
                      Negative int,
                      Achievements int,
                      Recommendations int,
                      Average_playtime_forever int,
                      Average_playtime_two_weeks int,
                      Median_playtime_forever int,
                      Median_playtime_two_weeks int,
                      Developers array<String>,
                      Publishers array<String>,
                      Categories array<String>,
                      Genres array<String>,
                      Tags array<String>,
                      Screenshots string,
                      Movies string,
                      Release_date_cleaned date,
                      OS array<String>,
                      owners_clean int
)
    row format delimited
        fields terminated by ';'
        collection items terminated by ','
        tblproperties ('skip.header.line.count'='1')
LOCATION '/hive/dataset';

LOAD DATA INPATH '/ouput/games_clean_new2.csv' OVERWRITE INTO TABLE games;

select * from games limit(5);

drop table games ;

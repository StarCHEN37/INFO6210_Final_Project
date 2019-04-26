SELECT * FROM mydb.music;
INSERT INTO mydb.musician(musician_name,company_name) SELECT musician,company_name FROM mydb.warnerbros_records_musicians;
INSERT INTO mydb.musician(musician_name,company_name) SELECT musician,company_name FROM mydb.columbia_records_musicians;
INSERT INTO mydb.musician(musician_name,company_name) SELECT musician,company_name FROM mydb.good_music_musicians;
SELECT * FROM mydb.musician;
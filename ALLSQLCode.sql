--Creating Database OnlineMusic
create DATABASE OnlineMusic;
USE OnlineMusic;
--Creating users table of given Schema
create table users (
userID varchar(30),
user_name varchar(30),
emailId nvarchar(320),
primary key(userID)
);
--Table created verified using
select *from users
--Inserting Data into the table
insert into users values('james3','James, S','james3@hotmail.co.uk');
insert into users values('olivia11','Olivia, J','oliva11@ntl.co.uk');
insert into users values('taylor05','Thomas, T','taylor05@freeserve.co.uk');
insert into users values('isabella9','Isabella, C','isabella9@msn.co.uk');
insert into users values('daniel77','Daniel, R','daniel77@hotmail.co.uk');
insert into users values('sophia91','Sophia, L','sophia91@tesco.co.uk');
--Table created and data inserted
--Creating a table for Music.
CREATE TABLE music (
    musicid VARCHAR(10) NOT NULL,
    title VARCHAR(100),
    categoryCode VARCHAR(5),
    costPerDownload DECIMAL(10, 2),
    PRIMARY KEY (musicid)
);
--Now adding data into the table music
insert into music values('M001','James Bond:Golden Eyes','C13',0.99);
insert into music values('M002','Lake House','C13',1.99);
insert into music values('M003','Dvorak: Symphony No 9','C11',1.49);
insert into music values('M004','Handel: Water Music','C11',1.79);
insert into music values('M005','Sense and Sensibility','C13',1.50);
insert into music values('M006','Beatles: Yesterday','C12',1.10);
insert into music values('M007','Elton John: Your Song','C12',0.89);
--Verify data is inserted or not 
select *from music
--Creating Table for musicDownload
create table musicDownload(
userID varchar(30) not null,
musicId varchar(10) not null,
downloadDate date not null,
foreign key(musicid) references music(musicid),
foreign key(userId) references users(userID)
);
--Now inserting Data into the musicDownload
insert into musicDownload values('james3','M002','2021-05-03');
insert into musicDownload values('isabella9','M005','2022-05-01');
insert into musicDownload values('olivia11','M002','2021-05-06');
insert into musicDownload values('isabella9','M001','2022-05-06');
insert into musicDownload values('james3','M003','2022-08-01');
insert into musicDownload values('daniel77','M004','2022-08-02');
insert into musicDownload values('sophia91','M007','2021-09-05');
--creating category Table
create table Category(
categoryCode varchar(5),
title varchar(30)
);

--inserting relatable data as given schema dosent show category and music table categoryCode relation:
insert into Category values('C11','Classic');
insert into Category values('C12','Pop-Rock');
insert into Category values('C13','Movie Soundtrack');
--check  data is inserted or not
select *from Category;
--1.The music id,the title and the categoryCode of all the music in the database,ordered by title.
select music.musicid,music.title,Category.title,Category.categoryCode from music inner join Category
on music.categoryCode = Category.categoryCode
--The number of users who downloaded 'Pop-Rock' category of music.
select count(CategoryCode) from (select musicDownload.userID,musicDownload.musicid,music.categoryCode,
Category.title from musicDownload inner join music on
musicDownload.musicid=music.musicid inner join Category on
Category.categoryCode = music.categoryCode) as Count where categoryCode = 'S121';
--The number of users who downloaded 'Pop-Rock' category of music as C12.
select count(CategoryCode) from (select musicDownload.userID,musicDownload.musicid,music.categoryCode,
Category.title from musicDownload inner join music on
musicDownload.musicid=music.musicid inner join Category on
Category.categoryCode = music.categoryCode) as Count where categoryCode = 'C12';
--The number of music downloads for each of the categories. The result listing should 
--include the titles of the categories and the number of music downloads for each category 
--title.
SELECT COUNT(CategoryCode), title
FROM (
    SELECT musicDownload.userID, musicDownload.musicid, music.categoryCode, Category.title
    FROM musicDownload
    INNER JOIN music ON musicDownload.musicid = music.musicid
    INNER JOIN Category ON Category.categoryCode = music.CategoryCode
) AS CountD
GROUP BY categoryCode, title;
--The titles of the categories for which music was downloaded more than once.
SELECT COUNT(CategoryCode), MIN(title) AS title
FROM (
    SELECT musicDownload.userID, musicDownload.musicid, music.categoryCode, Category.title
    FROM musicDownload
    INNER JOIN music ON musicDownload.musicid = music.musicid
    INNER JOIN Category ON Category.categoryCode = music.categoryCode
) AS CountD
GROUP BY categoryCode
HAVING COUNT(categoryCode) > 1;

----the SQL code to determine the number of products which were sold for each month of each year.
CREATE TABLE record2 (
    OrderNo INTEGER NOT NULL,
    ProductNo INTEGER NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Quantity INTEGER NOT NULL,
    Sales DECIMAL(10, 2) NOT NULL,
    QtrId INTEGER NOT NULL,
    MonthId INTEGER NOT NULL,
    YearId  INTEGER NOT NULL,
    );
 --insert data
insert into record2 values(10107,2,85.7,30,2587,1,2,2003);
insert into record2 values(10107,5, 95.8, 39, 3879.49, 1, 2, 2003);
insert into record2 values(10121 ,5 ,71.5 ,34 ,2700 ,1 ,2 ,2003);
insert into record2 values(10134 ,2, 94.74, 41, 3884.34, 3, 7, 2004);
insert into record2 values(10134 ,5 ,100 ,27 ,3307.77 ,3 ,7 ,2004);
insert into record2 values(10159 ,14, 100, 49, 5205.27, 4, 10, 2005);
insert into record2 values(10168 ,1 ,96.66 ,36 ,3479.66 ,4 ,10 ,2006);
insert into record2 values(10168 ,1, 96.66, 36, 3479.66, 4, 10, 2006);
select *from record2
--groupby
SELECT OrderNo, ProductNo, Price, QtrId, YearId, MonthId, SUM(Quantity)
FROM record2
GROUP BY OrderNo, ProductNo, Price, QtrId, YearId, MonthId;
-----STW7086CEM -DATA MANAGEMENT SYSTEM--SUBASH GAUTAM-MSC_BATCH 2----230083----




    

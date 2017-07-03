create database Data_File
go
use Data_File
go




Create Table Account
(
    ID		int			primary key identity,
	UserName    nvarchar(50) not null ,
	Email    nvarchar(50) not null ,
	Password    nvarchar(50) not null ,
);
go
create table Student
(
ID           int          primary key identity,
First_Name   nvarchar(50) not null ,
Last_Name    nvarchar(50) not null ,
Email        nvarchar(50) not null ,
AccountID int references Account(ID),

);						  
go

create table Trainer
(
ID             int        primary key  identity,
First_Name  nvarchar(50)  not null ,
Last_Name   nvarchar(50)  not null ,
Email       nvarchar(50)  not null ,
Specialist  nvarchar(50)  not null ,

AccountID int references Account(ID),
);

go
create table Major
(
ID    int primary key identity,
Name  nvarchar(50) not null 
);


go


create table Courses 
(
ID int primary key identity   ,
Name nvarchar(50) not null ,
MajorID int not null references Major(ID),
);




go

create table Section
(
SectionID    int      primary key  identity ,
TrainerID    int      not null     references Trainer(ID),
CourseID     int      not null     references Courses(ID) ,

DateFrom  	 date     not null ,
DateTo 	     date     not null ,


TimeFrom  time        not null ,
TimeTo    time        not null ,


Sunday     bit         not null ,
Monday	  bit         not null ,
Tuesday	  bit         not null ,
Wednesday bit         not null ,
Thursday  bit         not null ,
Friday	  bit         not null ,
Saturday  bit         not null ,

);


go
create table StudentSection 
(
StudenID          int  not null     references Student(ID) ,
SectionID         int  not null     references Section(SectionID),
					   
FirstMark             decimal(4,2)  not null ,
SecondMark			  decimal(4,2)  not null ,
ParticipantionMark	  decimal(4,2)  not null ,
FinalMark             decimal(4,2)  not null ,

);

go 

create table Files
(
ID               int                       primary key identity,
SectionID        int             not null  references Section(SectionID),
URL              nvarchar(50)    not null ,
DateAdded        datetime        not null ,
IsDeleted        bit             not null ,
Description	    nvarchar(max)    not null , 
);


go 

create table FileWho
(
FileID          int     not null references Files(ID),
StudentID       int     not null references Student(ID) ,
IsDownloaded    bit     not null 


);






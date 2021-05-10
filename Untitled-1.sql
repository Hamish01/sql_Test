-- 103599187 Hamish Sansom

--Client(ClientID, Surname, GivenName, Gender)
--Tour(TourName, Description)
--Event(EventYear, EventMonth, EventDay, Fee, TourName)
--FK (TourName) references Tour
--Booking(DateBooked, Payment, TourName, ClientID, EventYear, EventMonth, EventDay)
--FK (TourName, EventYear, EventMonth, EventDay) references Event
--FK (ClientID) references Client
--CREATE DATABASE db_9187
USE db_9187
/*
IF OBJECT_ID('CLIENT9187') IS NOT NULL
        DROP TABLE CLIENT9187;
IF OBJECT_ID('TOUR9187') IS NOT NULL
        DROP TABLE TOUR9187;
IF OBJECT_ID('EVENT9187') IS NOT NULL
        DROP TABLE EVENT9187;
IF OBJECT_ID('BOOKING9187') IS NOT NULL
        DROP TABLE BOOKING9187;
*/
GO
DROP TABLE IF EXISTS BOOKING9187;
DROP TABLE IF EXISTS EVENT9187;
DROP TABLE IF EXISTS TOUR9187;
DROP TABLE IF EXISTS CLIENT9187;

GO
CREATE TABLE CLIENT9187 (
    ClientID    INT
,   Surname     NVARCHAR(100)
,   GivenName   NVARCHAR(100)
,   Gender      NVARCHAR(1)     CHECK (Gender IN ('M','F','I'))
,   PRIMARY KEY (ClientID)
);

CREATE TABLE TOUR9187 (
    TourName     NVARCHAR(100)
,   Description  NVARCHAR(500)
,   PRIMARY KEY (TourName)
);

CREATE TABLE EVENT9187 (
    EventYear   INT         CHECK (LEN(EventYear) = 4)
,   EventMonth  NVARCHAR(3) CHECK (EventMonth IN('Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'))
,   EventDay    INT         CHECK (EventDay >= 1 and EventDay <= 31)
,   EventFee    MONEY       NOT NULL, CHECK(EventFee>0)
,   TourName    NVARCHAR(100)
,   PRIMARY KEY (EventYear, EventMonth, EventDay)
,   FOREIGN KEY (TourName)  REFERENCES TOUR9187   
);

CREATE TABLE BOOKING9187 (
    DateBooked  DATE    NOT NULL
,   Payment     MONEY   CHECK(Payment>0)
,   ClientID    INT
,   TourName    NVARCHAR(100)
,   EventYear   INT         CHECK (LEN(EventYear) = 4)
,   EventMonth  NVARCHAR(3) CHECK (EventMonth IN('Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'))
,   EventDay    INT         CHECK (EventDay >= 1 and EventDay <= 31)
,   FOREIGN KEY (ClientID)  REFERENCES CLIENT9187
,   FOREIGN KEY (EventYear, EventMonth, EventDay)  REFERENCES EVENT9187
,   FOREIGN KEY (TourName)  REFERENCES TOUR9187
);


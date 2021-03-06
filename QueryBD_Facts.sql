--
-- File generated with SQLiteStudio v3.3.3 on ma. mar. 1 14:43:59 2022
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: dim_artists
CREATE TABLE dim_artists
(
    "ArtistId" integer NOT NULL primary key autoincrement,
    "ArtistName" character varying(150) NOT NULL
);

-- Table: dim_customers
CREATE TABLE dim_customers
(
    "CustomerId" integer NOT NULL primary key autoincrement,
    "FirstName" nvarchar(40) NOT NULL,
    "LastName" nvarcharg(20) NOT NULL,
    "Company" nvarchar(80) NOT NULL,
    "Address" nvarchar(70) NOT NULL,
    "City" nvarchar(40) NOT NULL,
    "State" nvarchar(40) NOT NULL,
    "Country" nvarchar(40) NOT NULL,
    "PostalCode" nvarchar(10) NOT NULL,
    "Phone" nvarchar(24) NOT NULL,
    "Fax" nvarchar(24) NOT NULL,
    "Email" nvarchar(60) NOT NULL
);

-- Table: dim_employees
CREATE TABLE dim_employees
(
    "EmployeeId" integer NOT NULL primary key autoincrement,
    "LastName" nvarchar varying(20) NOT NULL,
    "FirstName" nvarchar varying(20) NOT NULL,
    "Title" nvarchar varying(30) NOT NULL,
    "BirthDate" nvarchar varying(25) NOT NULL,
    "HireDate" nvarcha varying(25) NOT NULL,
    "Address" nvarchar varying(70) NOT NULL,
    "City" nvarchar varying(40) NOT NULL,
    "State" nvarchar varying(40) NOT NULL,
    "Country" nvarchar varying(40) NOT NULL,
    "PostalCode" nvarchar varying(10) NOT NULL,
    "Phone" nvarchar varying(24) NOT NULL,
    "Fax" nvarchar varying(24) NOT NULL,
    "Email" nvarchar varying(60) NOT NULL
);

-- Table: dim_location
CREATE TABLE dim_location
(
    "LocationId" integer NOT NULL primary key autoincrement,
    "Address" character varying(60) NOT NULL,
    "City" character varying(60)  NOT NULL,
    "State" character varying(40)  NOT NULL,
    "Country" character varying(40)  NOT NULL,
    "PostalCode" character varying(10) NOT NULL
);

-- Table: dim_Time
CREATE TABLE dim_Time(
    TimeId INTEGER NOT NULL primary key autoincrement,
    fecha date NOT NULL,
    a?o INTEGER NOT NULL,
    mes INTEGER NOT NULL,
    dia INTEGER NOT NULL,
    nombre_dia nvarchar(50) NOT NULL,
    dia_semana integer  NOT NULL,
    semana integer NOT NULL,
    trimestre integer NOT NULL
);

-- Table: dim_tracks
CREATE TABLE dim_tracks
(
    "TrackId" integer NOT NULL primary key autoincrement,
    "TrackName" character varying(200) NOT NULL,
    "Album" character varying(200) NOT NULL,
    "Genre" character varying(100) NOT NULL,
    "MediaType" character varying(200) NOT NULL,
    "Composer" character varying(200) NOT NULL,
    "Milliseconds" bigint NOT NULL,
    "Bytes" bigint NOT NULL,
    "Price" numeric(5, 2) NOT NULL
);

-- Table: fact_Sales
CREATE TABLE "fact_Sales"(
    id_Fact integer not null primary key autoincrement,
    CustomerId integer not null,
    EmployeeId integer not null,
    TrackId integer not null,
    ArtistId integer not null,
    LocationId integer not null,
    TimeId integer not null,
    Price numeric(10,2) not null,
    FOREIGN KEY (
        CustomerId
    )
    REFERENCES dim_customers (CustomerId) ON DELETE NO ACTION
                                    ON UPDATE NO ACTION,
    FOREIGN KEY (
        EmployeeId
    )
    REFERENCES dim_employees (EmployeeId) ON DELETE NO ACTION
                                    ON UPDATE NO ACTION,
    FOREIGN KEY (
        LocationId
    )
    REFERENCES dim_location (LocationId) ON DELETE NO ACTION
                                    ON UPDATE NO ACTION,
    FOREIGN KEY (
        TimeId
    )
    REFERENCES dim_Time (TimeId) ON DELETE NO ACTION
                                    ON UPDATE NO ACTION,
    FOREIGN KEY (
        ArtistId
    )
    REFERENCES dim_artists (ArtistId) ON DELETE NO ACTION
                                    ON UPDATE NO ACTION,
    FOREIGN KEY (
        TrackId
    )
    REFERENCES dim_tracks (TrackId) ON DELETE NO ACTION
                                    ON UPDATE NO ACTION                                                                    
);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;

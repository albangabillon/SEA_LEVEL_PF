CREATE TABLE MESURES (
ID integer primary key generated always as identity,
STATION VARCHAR(15) NOT NULL,
SENSOR VARCHAR(15) NOT NULL,
RAW_TIME_UTC timestamp(0),
FLAG1 VARCHAR(3) NOT NULL,
RAW_DATA NUMERIC(7,3),
FLAG2 VARCHAR(7) NOT NULL,
CORRECT_TIME_UTC timestamp(0),
FLAG3 VARCHAR(8) NOT NULL,
CORR_DATA NUMERIC(7,3),
FLAG4 VARCHAR(11) NOT NULL,
CONSTRAINT candidate_key UNIQUE (STATION,SENSOR,FLAG1,CORRECT_TIME_UTC),
CONSTRAINT cons_sensor CHECK (SENSOR IN ('RADAR','PRESSURE','FLOAT')),
CONSTRAINT cons_flag1 CHECK (FLAG1 IN ('GPS','IOC')),
CONSTRAINT cons_flag2 CHECK (FLAG2 IN ('VALID','INVALID','MISSING')),
CONSTRAINT cons_flag3 CHECK (FLAG3 IN ('GPS','IOC','ADJUSTED')),
CONSTRAINT cons_flag4 CHECK (FLAG4 IN ('VALID','COR_APPL','MISSING'))
);
/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T1-rm-schema.sql

--Student ID: 33520054
--Student Name: Ang Qiao Xin

/* Comments for your marker:




*/

/* drop table statements - do not remove*/

DROP TABLE competitor CASCADE CONSTRAINTS PURGE;

DROP TABLE entry CASCADE CONSTRAINTS PURGE;

DROP TABLE team CASCADE CONSTRAINTS PURGE;

/* end of drop table statements*/

-- Task 1 Add Create table statements for the Missing TABLES below.
-- Ensure all column comments, and constraints (other than FK's)are included.
-- FK constraints are to be added at the end of this script

-- COMPETITOR
CREATE TABLE competitor (
    comp_no         NUMBER(5)     NOT NULL,
    comp_fname      VARCHAR2(30)  NOT NULL,
    comp_lname      VARCHAR2(30)  NOT NULL,
    comp_gender     CHAR(1)       NOT NULL,
    comp_dob        DATE          NOT NULL,
    comp_email      VARCHAR2(50)  NOT NULL,
    comp_unistatus  CHAR(1)       NOT NULL,
    comp_phone      CHAR(10)      NOT NULL
);

COMMENT ON COLUMN competitor.comp_no IS 'Unique identifier for a competitor';
COMMENT ON COLUMN competitor.comp_fname IS 'Competitor''s first name';
COMMENT ON COLUMN competitor.comp_lname IS 'Competitor''s last name';
COMMENT ON COLUMN competitor.comp_gender IS 'Competitor''s gender (''M'' for male, ''F'' for female, or ''U'' for ''Undisclosed'')';
COMMENT ON COLUMN competitor.comp_dob IS 'Competitor''s date of birth';
COMMENT ON COLUMN competitor.comp_email IS 'Competitor''s email - unique for each competitor';
COMMENT ON COLUMN competitor.comp_unistatus IS 'Competitor is a university student or staff (''Y'' for Yes or ''N'' for No)';
COMMENT ON COLUMN competitor.comp_phone IS 'Competitor''s phone number - unique for each competitor';

ALTER TABLE competitor ADD CONSTRAINT competitor_pk PRIMARY KEY (comp_no);
ALTER TABLE competitor ADD CONSTRAINT competitor_uq1 UNIQUE (comp_email);
ALTER TABLE competitor ADD CONSTRAINT competitor_uq2 UNIQUE (comp_phone);
ALTER TABLE competitor ADD CONSTRAINT chk_comp_gender CHECK (comp_gender IN ('M', 'F', 'U'));
ALTER TABLE competitor ADD CONSTRAINT chk_comp_unistatus CHECK (comp_unistatus IN ('Y', 'N'));


--ENTRY



--TEAM



-- Add all missing FK Constraints below here

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
    comp_fname      VARCHAR2(30)  ,
    comp_lname      VARCHAR2(30)  ,
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
ALTER TABLE competitor ADD CONSTRAINT competitor_email_uq UNIQUE (comp_email);
ALTER TABLE competitor ADD CONSTRAINT competitor_phone_uq UNIQUE (comp_phone);
ALTER TABLE competitor ADD CONSTRAINT chk_comp_gender CHECK (comp_gender IN ('M', 'F', 'U'));
ALTER TABLE competitor ADD CONSTRAINT chk_comp_unistatus CHECK (comp_unistatus IN ('Y', 'N'));


--ENTRY
CREATE TABLE entry (
    event_id           NUMBER(6)   NOT NULL,
    entry_no           NUMBER(5)   NOT NULL,
    entry_starttime    DATE,
    entry_finishtime   DATE,
    entry_elapsedtime  DATE,
    comp_no            NUMBER(5)   NOT NULL,
    team_id            NUMBER(3),
    char_id            NUMBER(3)
);

COMMENT ON COLUMN entry.entry_no IS 'Entry number (unique only within an event)';
COMMENT ON COLUMN entry.entry_starttime IS 'The entrant''s start time (time only), stored using the format of hh24:mi:ss';
COMMENT ON COLUMN entry.entry_finishtime IS 'The entrant''s finish time (time only), stored using the format of hh24:mi:ss';
COMMENT ON COLUMN entry.entry_elapsedtime IS 'The time the entrant took to complete the event, stored using the format of hh24:mi:ss (e.g. 01:25:30 for 1 hour 25 minutes and 30 seconds)';
COMMENT ON COLUMN entry.event_id IS 'Event id (surrogate primary key)';
COMMENT ON COLUMN entry.comp_no IS 'Unique identifier for a competitor';
COMMENT ON COLUMN entry.team_id IS 'Team identifier (unique)';
COMMENT ON COLUMN entry.char_id IS 'Charity unique identifier';

ALTER TABLE entry ADD CONSTRAINT entry_pk PRIMARY KEY (event_id, entry_no);
ALTER TABLE entry ADD CONSTRAINT chk_entry_no CHECK (entry_no > 0);

--TEAM
CREATE TABLE team (
    team_id     NUMBER(3)     NOT NULL,
    team_name   VARCHAR2(30)  NOT NULL,
    carn_date   DATE          NOT NULL,
    event_id    NUMBER(6)     NOT NULL,
    entry_no    NUMBER(5)     NOT NULL
);

COMMENT ON COLUMN team.team_id IS 'Team identifier (unique)';
COMMENT ON COLUMN team.team_name IS 'Team name';
COMMENT ON COLUMN team.carn_date IS 'Date of carnival (unique identifier)';
COMMENT ON COLUMN team.event_id IS 'Event id (surrogate primary key)';
COMMENT ON COLUMN team.entry_no IS 'Entry number (unique only within an event)';

ALTER TABLE team ADD CONSTRAINT team_pk PRIMARY KEY (team_id);
ALTER TABLE team ADD CONSTRAINT team_nk UNIQUE (team_name, carn_date);

-- Add all missing FK Constraints below here
ALTER TABLE entry 
    ADD CONSTRAINT event_entry_fk FOREIGN KEY (event_id)
        REFERENCES event (event_id);

ALTER TABLE entry 
    ADD CONSTRAINT competitor_entry_fk FOREIGN KEY (comp_no)
        REFERENCES competitor (comp_no);

ALTER TABLE entry 
    ADD CONSTRAINT team_entry_fk FOREIGN KEY (team_id)
        REFERENCES team (team_id);

ALTER TABLE entry 
    ADD CONSTRAINT charity_entry_fk FOREIGN KEY (char_id)
        REFERENCES charity (char_id);

ALTER TABLE team 
    ADD CONSTRAINT carnival_team_fk FOREIGN KEY (carn_date)
        REFERENCES carnival (carn_date);

ALTER TABLE team 
    ADD CONSTRAINT entry_team_fk FOREIGN KEY (event_id, entry_no)
        REFERENCES entry (event_id, entry_no);
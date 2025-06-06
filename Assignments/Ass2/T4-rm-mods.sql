--****PLEASE ENTER YOUR DETAILS BELOW****
--T4-rm-mods.sql

--Student ID: 33520054
--Student Name: Ang Qiao Xin

/* Comments for your marker:




*/

--(a)
-- Add the new column
ALTER TABLE competitor
ADD num_completed_events NUMBER(3);
COMMENT ON COLUMN competitor.num_completed_events IS 'Number of events completed by the competitor';

UPDATE competitor c
SET num_completed_events = (
    SELECT COUNT(*) 
    FROM entry ent
    WHERE ent.comp_no = c.comp_no
      AND ent.entry_starttime IS NOT NULL
      AND ent.entry_finishtime IS NOT NULL
);

SELECT comp_no, comp_fname, comp_lname, num_completed_events
FROM competitor
ORDER BY comp_no;
DESC competitor;

--(b)
-- Create the associative table

DROP TABLE charity_support CASCADE CONSTRAINTS PURGE;
DROP SEQUENCE cs_seq;
CREATE SEQUENCE cs_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE charity_support (
    cs_id      NUMBER(6) NOT NULL,
    event_id     NUMBER(6) NOT NULL,
    entry_no     NUMBER(5) NOT NULL,
    char_id     NUMBER(3) NOT NULL,
    percentage  NUMBER(3) NOT NULL CHECK (percentage BETWEEN 0 AND 100)
);

COMMENT ON COLUMN charity_support.cs_id IS 'Surrogate key of event_id,entry_no,char_id';
COMMENT ON COLUMN charity_support.event_id IS 'Event id (surrogate primary key)';
COMMENT ON COLUMN charity_support.entry_no IS 'Entry number (unique only within an event)';
COMMENT ON COLUMN charity_support.char_id IS 'Charity unique identifier';
COMMENT ON COLUMN charity_support.percentage IS 'Percent of funds raised by the competitor (0-100) for this charity';

ALTER TABLE charity_support ADD CONSTRAINT charity_support_pk PRIMARY KEY (cs_id);
ALTER TABLE charity_support ADD CONSTRAINT entry_charsupp_fk FOREIGN KEY (event_id, entry_no) REFERENCES entry (event_id, entry_no);
ALTER TABLE charity_support ADD CONSTRAINT charity_charsupp_fk FOREIGN KEY (char_id) REFERENCES charity (char_id);
ALTER TABLE charity_support ADD CONSTRAINT charity_support_nk UNIQUE (event_id, entry_no, char_id);

--  Migrate every existing charity to new table
INSERT INTO charity_support (cs_id, event_id, entry_no, char_id, percentage)
SELECT cs_seq.NEXTVAL,
  ent.event_id,
  ent.entry_no,
  ent.char_id,
  100
FROM entry ent
WHERE ent.char_id IS NOT NULL;

ALTER TABLE entry DROP COLUMN char_id;

-- Insert Jackson Bull's charity support percentages
INSERT INTO charity_support (cs_id, event_id, entry_no, char_id, percentage)
SELECT cs_seq.NEXTVAL,
 ent.event_id,
 ent.entry_no,
    ( SELECT char_id 
      FROM charity 
      WHERE UPPER(char_name) = UPPER('RSPCA')
    ) AS char_id,
 70
FROM entry ent
  JOIN competitor c ON c.comp_no = ent.comp_no
  JOIN event ev ON ev.event_id = ent.event_id
  JOIN carnival ca ON ca.carn_date = ev.carn_date
WHERE c.comp_phone = '0401234567'
AND UPPER(ca.carn_name) = 'RM WINTER SERIES CAULFIELD 2025';

INSERT INTO charity_support (cs_id, event_id, entry_no, char_id, percentage)
SELECT 
    cs_seq.NEXTVAL,
    ent.event_id,
    ent.entry_no,
    ( SELECT char_id 
      FROM charity 
      WHERE UPPER(char_name) = UPPER('Beyond Blue')
    ) AS char_id,
    30
FROM entry ent
JOIN competitor c ON c.comp_no = ent.comp_no
JOIN event ev ON ev.event_id = ent.event_id
JOIN carnival ca ON ca.carn_date = ev.carn_date
WHERE c.comp_phone = '0401234567'
  AND ca.carn_date = (
        SELECT carn_date 
        FROM carnival 
        WHERE UPPER(carn_name) = UPPER('RM WINTER SERIES CAULFIELD 2025')
    );


-- View the data
SELECT 
    event_id,
    entry_no,
    TO_CHAR(entry_starttime, 'HH24:MI:SS') AS entry_starttime,
    TO_CHAR(entry_finishtime, 'HH24:MI:SS') AS entry_finishtime,
    TO_CHAR(entry_elapsedtime, 'HH24:MI:SS') AS entry_elapsedtime,
    comp_no,
    team_id
FROM entry;
select * from charity_support;

DESC entry;
DESC charity_support;

COMMIT;

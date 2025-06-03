--****PLEASE ENTER YOUR DETAILS BELOW****
--T4-rm-mods.sql

--Student ID: 33520054
--Student Name: Ang Qiao Xin

/* Comments for your marker:




*/

--(a)
-- Add the new column
ALTER TABLE competitor ADD completed_events NUMBER(3);

UPDATE competitor c
SET completed_events = (
    SELECT COUNT(*) FROM entry e
    WHERE e.comp_no = c.comp_no
      AND e.entry_starttime IS NOT NULL
      AND e.entry_finishtime IS NOT NULL
);

DESC competitor;


--(b)



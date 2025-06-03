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

SELECT comp_no, comp_fname, comp_lname, completed_events
FROM competitor
ORDER BY comp_no;
DESC competitor;

--(b)
-- Create the associative table
CREATE TABLE charity_support (
    comp_no     NUMBER(4) NOT NULL,
    char_id     NUMBER(3) NOT NULL,
    carn_date   DATE NOT NULL,
    percentage  NUMBER(3) CHECK (percentage BETWEEN 0 AND 100),

    CONSTRAINT charity_support_pk PRIMARY KEY (comp_no, char_id, carn_date),
    CONSTRAINT comp_fk FOREIGN KEY (comp_no) REFERENCES competitor (comp_no),
    CONSTRAINT char_fk FOREIGN KEY (char_id) REFERENCES charity (char_id),
    CONSTRAINT carn_fk FOREIGN KEY (carn_date) REFERENCES carnival (carn_date)
);




--****PLEASE ENTER YOUR DETAILS BELOW****
--T3-rm-dm.sql

--Student ID: 33520054
--Student Name: Ang Qiao Xin

/* Comments for your marker:




*/

--(a)
DROP SEQUENCE comp_seq;
CREATE SEQUENCE comp_seq START WITH 100 INCREMENT BY 5;

DROP SEQUENCE team_seq;
CREATE SEQUENCE team_seq START WITH 100 INCREMENT BY 5;


--(b)
INSERT INTO competitor
VALUES (comp_seq.NEXTVAL, 'Keith', 'Rose', 'M', TO_DATE('1995-04-10', 'YYYY-MM-DD'),
        'keith.rose@student.monash.edu', 'Y', '0422141112');

INSERT INTO competitor
VALUES (comp_seq.NEXTVAL, 'Jackson', 'Bull', 'M', TO_DATE('1996-06-15', 'YYYY-MM-DD'),
        'jackson.bull@student.monash.edu', 'Y', '0422412524');

-- Create team
INSERT INTO team
VALUES (
    team_seq.NEXTVAL, 'Super Runners',
    (SELECT carn_date FROM carnival WHERE UPPER(carn_name) = UPPER('RM WINTER SERIES CAULFIELD 2025')),
    (SELECT event_id FROM event 
     WHERE carn_date = (SELECT carn_date FROM carnival WHERE UPPER(carn_name) = UPPER('RM WINTER SERIES CAULFIELD 2025'))
       AND UPPER(eventtype_code) = UPPER('10K')),
    1
);

-- Insert Keith entry
INSERT INTO entry (event_id, entry_no, entry_starttime, entry_finishtime, entry_elapsedtime,
                   comp_no, team_id, char_id)
VALUES (
    (SELECT event_id FROM event WHERE carn_date = 
        (SELECT carn_date FROM carnival WHERE UPPER(carn_name) = 'RM WINTER SERIES CAULFIELD 2025')
        AND UPPER(eventtype_code) = UPPER('10K')),
    (SELECT NVL(MAX(entry_no), 0) + 1 FROM entry 
     WHERE event_id = (
         SELECT event_id FROM event 
         WHERE carn_date = (SELECT carn_date FROM carnival WHERE UPPER(carn_name) = 'RM WINTER SERIES CAULFIELD 2025')
           AND UPPER(eventtype_code) = UPPER('10K'))),
    NULL, NULL, NULL,
    (SELECT comp_no FROM competitor WHERE comp_phone = '0422141112'),
    (SELECT team_id FROM team WHERE team_name = 'Super Runners' 
        AND carn_date = (SELECT carn_date FROM carnival WHERE UPPER(carn_name) = 'RM WINTER SERIES CAULFIELD 2025')),
    (SELECT char_id FROM charity WHERE UPPER(char_name) = UPPER('Salvation Army'))
);


-- Insert Jackson entry
INSERT INTO entry (event_id, entry_no, entry_starttime, entry_finishtime, entry_elapsedtime,
                   comp_no, team_id, char_id)
VALUES (
    (SELECT event_id FROM event WHERE carn_date = 
        (SELECT carn_date FROM carnival WHERE UPPER(carn_name) = 'RM WINTER SERIES CAULFIELD 2025')
        AND UPPER(eventtype_code) = UPPER('10K')),
    (SELECT NVL(MAX(entry_no), 0) + 1 FROM entry 
     WHERE event_id = (
         SELECT event_id FROM event 
         WHERE carn_date = (SELECT carn_date FROM carnival WHERE UPPER(carn_name) = 'RM WINTER SERIES CAULFIELD 2025')
           AND UPPER(eventtype_code) = UPPER('10K'))),
    NULL,NULL,NULL,
    (SELECT comp_no FROM competitor WHERE comp_phone = '0422412524'),
    (SELECT team_id FROM team WHERE team_name = 'Super Runners' 
        AND carn_date = (SELECT carn_date FROM carnival WHERE UPPER(carn_name) = 'RM WINTER SERIES CAULFIELD 2025')),
    (SELECT char_id FROM charity WHERE UPPER(char_name) = UPPER('RSPCA'))
);


--(c)

--(d)


COMMIT;

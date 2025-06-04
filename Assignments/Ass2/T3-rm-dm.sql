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

-- create entry
-- Insert Keith entry using eventtype_desc '10 km run'
INSERT INTO entry (
    event_id, entry_no, entry_starttime, entry_finishtime, entry_elapsedtime,
    comp_no, team_id, char_id
)
VALUES (
    (
        SELECT event_id
        FROM event
        WHERE carn_date = (
            SELECT carn_date
            FROM carnival
            WHERE UPPER(carn_name) = UPPER('RM WINTER SERIES CAULFIELD 2025')
        )
        AND eventtype_code = (
            SELECT eventtype_code
            FROM eventtype
            WHERE UPPER(eventtype_desc) = UPPER('10 km run')
        )
    ),
    (
        SELECT NVL(MAX(entry_no), 0) + 1
        FROM entry
        WHERE event_id = (
            SELECT event_id
            FROM event
            WHERE carn_date = (
                SELECT carn_date
                FROM carnival
                WHERE UPPER(carn_name) = UPPER('RM WINTER SERIES CAULFIELD 2025')
            )
            AND eventtype_code = (
                SELECT eventtype_code
                FROM eventtype
                WHERE UPPER(eventtype_desc) = UPPER('10 km run')
            )
        )
    ),
    NULL, NULL, NULL,
    (SELECT comp_no FROM competitor WHERE comp_phone = '0422141112'),
    NULL,
    (
        SELECT char_id
        FROM charity
        WHERE UPPER(char_name) = UPPER('Salvation Army')
    )
);

select * from entry;
select * from carnival;
-- Insert Jackson entry using eventtype_desc '10 km run'
INSERT INTO entry (
    event_id, entry_no, entry_starttime, entry_finishtime, entry_elapsedtime,
    comp_no, team_id, char_id
)
VALUES (
    (
        SELECT event_id
        FROM event
        WHERE carn_date = (
            SELECT carn_date
            FROM carnival
            WHERE UPPER(carn_name) = UPPER('RM WINTER SERIES CAULFIELD 2025')
        )
        AND eventtype_code = (
            SELECT eventtype_code
            FROM eventtype
            WHERE UPPER(eventtype_desc) = UPPER('10 km run')
        )
    ),
    (
        SELECT NVL(MAX(entry_no), 0) + 1
        FROM entry
        WHERE event_id = (
            SELECT event_id
            FROM event
            WHERE carn_date = (
                SELECT carn_date
                FROM carnival
                WHERE UPPER(carn_name) = UPPER('RM WINTER SERIES CAULFIELD 2025')
            )
            AND eventtype_code = (
                SELECT eventtype_code
                FROM eventtype
                WHERE UPPER(eventtype_desc) = UPPER('10 km run')
            )
        )
    ),
    NULL, NULL, NULL,
    (SELECT comp_no FROM competitor WHERE comp_phone = '0422412524'),
    NULL,
    (
        SELECT char_id
        FROM charity
        WHERE UPPER(char_name) = UPPER('RSPCA')
    )
);

INSERT INTO team (
    team_id, team_name, carn_date, event_id, entry_no
)
VALUES (
    team_seq.NEXTVAL,
    'Super Runners',
    (SELECT carn_date 
     FROM carnival 
     WHERE UPPER(carn_name) = UPPER('RM WINTER SERIES CAULFIELD 2025')),
    
    (SELECT event_id 
     FROM event 
     WHERE carn_date = (SELECT carn_date 
                        FROM carnival 
                        WHERE UPPER(carn_name) = UPPER('RM WINTER SERIES CAULFIELD 2025'))
       AND eventtype_code = (
           SELECT eventtype_code 
           FROM eventtype 
           WHERE UPPER(eventtype_desc) = UPPER('10 km run'))),
    
    (SELECT entry_no 
     FROM entry 
     WHERE comp_no = (
         SELECT comp_no 
         FROM competitor 
         WHERE comp_phone = '0422141112') -- Keith
       AND event_id = (
         SELECT event_id 
         FROM event 
         WHERE carn_date = (SELECT carn_date 
                            FROM carnival 
                            WHERE UPPER(carn_name) = UPPER('RM WINTER SERIES CAULFIELD 2025'))
           AND eventtype_code = (
               SELECT eventtype_code 
               FROM eventtype 
               WHERE UPPER(eventtype_desc) = UPPER('10 km run')))
    )
);

-- Update Keith's entry
UPDATE entry
SET team_id = (
    SELECT team_id 
    FROM team 
    WHERE team_name = 'Super Runners' 
      AND carn_date = (SELECT carn_date 
                       FROM carnival 
                       WHERE UPPER(carn_name) = UPPER('RM WINTER SERIES CAULFIELD 2025'))
)
WHERE comp_no = (
    SELECT comp_no 
    FROM competitor 
    WHERE comp_phone = '0422141112' -- Keith
)
AND event_id = (
    SELECT event_id 
    FROM event 
    WHERE carn_date = (SELECT carn_date 
                       FROM carnival 
                       WHERE UPPER(carn_name) = UPPER('RM WINTER SERIES CAULFIELD 2025'))
      AND eventtype_code = (
          SELECT eventtype_code 
          FROM eventtype 
          WHERE UPPER(eventtype_desc) = UPPER('10 Km Run'))
);

-- Update Jackson's entry
UPDATE entry
SET team_id = (
    SELECT team_id 
    FROM team 
    WHERE team_name = 'Super Runners' 
      AND carn_date = (SELECT carn_date 
                       FROM carnival 
                       WHERE UPPER(carn_name) = UPPER('RM WINTER SERIES CAULFIELD 2025'))
)
WHERE comp_no = (
    SELECT comp_no 
    FROM competitor 
    WHERE comp_phone = '0422412524' -- Jackson
)
AND event_id = (
    SELECT event_id 
    FROM event 
    WHERE carn_date = (SELECT carn_date 
                       FROM carnival 
                       WHERE UPPER(carn_name) = UPPER('RM WINTER SERIES CAULFIELD 2025'))
      AND eventtype_code = (
          SELECT eventtype_code 
          FROM eventtype 
          WHERE UPPER(eventtype_desc) = UPPER('10 Km Run'))
);


--(c)

-- 1. DELETE Jackson's existing 10K entry
DELETE FROM entry
WHERE comp_no = (
    SELECT comp_no FROM competitor WHERE comp_phone = '0422412524'
)
AND event_id = (
    SELECT event_id FROM event 
    WHERE carn_date = (
        SELECT carn_date FROM carnival 
        WHERE UPPER(carn_name) = UPPER('RM WINTER SERIES CAULFIELD 2025')
    )
    AND UPPER(eventtype_code) = UPPER('10K')
);

-- 2. INSERT new 5K entry for Jackson with updated charity
INSERT INTO entry (
    event_id, entry_no, entry_starttime, entry_finishtime, entry_elapsedtime,
    comp_no, team_id, char_id
)
VALUES (
    -- event_id for 5K in same carnival
    (SELECT event_id FROM event 
     WHERE carn_date = (
         SELECT carn_date FROM carnival 
         WHERE UPPER(carn_name) = UPPER('RM WINTER SERIES CAULFIELD 2025')
     )
     AND UPPER(eventtype_code) = UPPER('5K')),

    -- next available entry_no
    (SELECT NVL(MAX(entry_no), 0) + 1 FROM entry 
     WHERE event_id = (
         SELECT event_id FROM event 
         WHERE carn_date = (
             SELECT carn_date FROM carnival 
             WHERE UPPER(carn_name) = UPPER('RM WINTER SERIES CAULFIELD 2025')
         )
         AND UPPER(eventtype_code) = UPPER('5K'))),

    NULL,NULL,NULL,

    -- comp_no for Jackson
    (SELECT comp_no FROM competitor WHERE comp_phone = '0422412524'),

    -- assuming no team now
    NULL,

    -- new charity: Beyond Blue
    (SELECT char_id FROM charity WHERE UPPER(char_name) = UPPER('Beyond Blue'))
);

--(d)
DELETE FROM entry
WHERE comp_no = (
    SELECT comp_no FROM competitor
    WHERE comp_phone = '0422141112'
)
AND event_id = (
    SELECT event_id FROM event
    WHERE carn_date = (
        SELECT carn_date FROM carnival
        WHERE UPPER(carn_name) = UPPER('RM WINTER SERIES CAULFIELD 2025')
    )
    AND UPPER(eventtype_code) = UPPER('10K')
);

DELETE FROM team
WHERE UPPER(team_name) = UPPER('Super Runners')
AND carn_date = (
    SELECT carn_date FROM carnival
    WHERE UPPER(carn_name) = UPPER('RM WINTER SERIES CAULFIELD 2025')
);

COMMIT;

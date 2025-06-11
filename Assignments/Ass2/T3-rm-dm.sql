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
INSERT INTO competitor VALUES ( comp_seq.NEXTVAL,
                                'Keith',
                                'Rose',
                                'M',
                                TO_DATE('1995-04-10','YYYY-MM-DD'),
                                'keith.rose@student.monash.edu',
                                'Y',
                                '0422141112' );

INSERT INTO competitor VALUES ( comp_seq.NEXTVAL,
                                'Jackson',
                                'Bull',
                                'M',
                                TO_DATE('1996-06-15','YYYY-MM-DD'),
                                'jackson.bull@student.monash.edu',
                                'Y',
                                '0422412524' );

-- Insert Keith entry
INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES ( (
    SELECT event_id
      FROM event
     WHERE carn_date = (
            SELECT carn_date
              FROM carnival
             WHERE upper(carn_name) = upper('RM WINTER SERIES CAULFIELD 2025')
        )
       AND eventtype_code = (
        SELECT eventtype_code
          FROM eventtype
         WHERE upper(eventtype_desc) = upper('10 km run')
    )
),
           (
               SELECT nvl(
                   max(entry_no),
                   0
               ) + 1
                 FROM entry
                WHERE event_id = (
                   SELECT event_id
                     FROM event
                    WHERE carn_date = (
                           SELECT carn_date
                             FROM carnival
                            WHERE upper(carn_name) = upper('RM WINTER SERIES CAULFIELD 2025'
                            )
                       )
                      AND eventtype_code = (
                       SELECT eventtype_code
                         FROM eventtype
                        WHERE upper(eventtype_desc) = upper('10 km run')
                   )
               )
           ),
           NULL,
           NULL,
           NULL,
           (
               SELECT comp_no
                 FROM competitor
                WHERE comp_phone = '0422141112'
           ),
           NULL,
           (
               SELECT char_id
                 FROM charity
                WHERE upper(char_name) = upper('Salvation Army')
           ) );

-- Insert Jackson entry
INSERT INTO entry (
    event_id,
    entry_no,
    entry_starttime,
    entry_finishtime,
    entry_elapsedtime,
    comp_no,
    team_id,
    char_id
) VALUES ( (
    SELECT event_id
      FROM event
     WHERE carn_date = (
            SELECT carn_date
              FROM carnival
             WHERE upper(carn_name) = upper('RM WINTER SERIES CAULFIELD 2025')
        )
       AND eventtype_code = (
        SELECT eventtype_code
          FROM eventtype
         WHERE upper(eventtype_desc) = upper('10 km run')
    )
),
           (
               SELECT nvl(
                   max(entry_no),
                   0
               ) + 1
                 FROM entry
                WHERE event_id = (
                   SELECT event_id
                     FROM event
                    WHERE carn_date = (
                           SELECT carn_date
                             FROM carnival
                            WHERE upper(carn_name) = upper('RM WINTER SERIES CAULFIELD 2025'
                            )
                       )
                      AND eventtype_code = (
                       SELECT eventtype_code
                         FROM eventtype
                        WHERE upper(eventtype_desc) = upper('10 km run')
                   )
               )
           ),
           NULL,
           NULL,
           NULL,
           (
               SELECT comp_no
                 FROM competitor
                WHERE comp_phone = '0422412524'
           ),
           NULL,
           (
               SELECT char_id
                 FROM charity
                WHERE upper(char_name) = upper('RSPCA')
           ) );

INSERT INTO team (
    team_id,
    team_name,
    carn_date,
    event_id,
    entry_no
) VALUES ( team_seq.NEXTVAL,
           'Super Runners',
           (
               SELECT carn_date
                 FROM carnival
                WHERE upper(carn_name) = upper('RM WINTER SERIES CAULFIELD 2025')
           ),
           (
               SELECT event_id
                 FROM event
                WHERE carn_date = (
                       SELECT carn_date
                         FROM carnival
                        WHERE upper(carn_name) = upper('RM WINTER SERIES CAULFIELD 2025'
                        )
                   )
                  AND eventtype_code = (
                   SELECT eventtype_code
                     FROM eventtype
                    WHERE upper(eventtype_desc) = upper('10 km run')
               )
           ),
           (
               SELECT entry_no
                 FROM entry
                WHERE comp_no = (
                       SELECT comp_no
                         FROM competitor
                        WHERE comp_phone = '0422141112'
                   ) -- Keith
                  AND event_id = (
                   SELECT event_id
                     FROM event
                    WHERE carn_date = (
                           SELECT carn_date
                             FROM carnival
                            WHERE upper(carn_name) = upper('RM WINTER SERIES CAULFIELD 2025'
                            )
                       )
                      AND eventtype_code = (
                       SELECT eventtype_code
                         FROM eventtype
                        WHERE upper(eventtype_desc) = upper('10 km run')
                   )
               )
           ) );

-- Update Keith's entry
UPDATE entry
   SET
    team_id = (
        SELECT team_id
          FROM team
         WHERE team_name = 'Super Runners'
           AND carn_date = (
            SELECT carn_date
              FROM carnival
             WHERE upper(carn_name) = upper('RM WINTER SERIES CAULFIELD 2025')
        )
    )
 WHERE comp_no = (
        SELECT comp_no
          FROM competitor
         WHERE comp_phone = '0422141112' -- Keith
    )
   AND event_id = (
    SELECT event_id
      FROM event
     WHERE carn_date = (
            SELECT carn_date
              FROM carnival
             WHERE upper(carn_name) = upper('RM WINTER SERIES CAULFIELD 2025')
        )
       AND eventtype_code = (
        SELECT eventtype_code
          FROM eventtype
         WHERE upper(eventtype_desc) = upper('10 km run')
    )
);

-- Update Jackson's entry
UPDATE entry
   SET
    team_id = (
        SELECT team_id
          FROM team
         WHERE team_name = 'Super Runners'
           AND carn_date = (
            SELECT carn_date
              FROM carnival
             WHERE upper(carn_name) = upper('RM WINTER SERIES CAULFIELD 2025')
        )
    )
 WHERE comp_no = (
        SELECT comp_no
          FROM competitor
         WHERE comp_phone = '0422412524' -- Jackson
    )
   AND event_id = (
    SELECT event_id
      FROM event
     WHERE carn_date = (
            SELECT carn_date
              FROM carnival
             WHERE upper(carn_name) = upper('RM WINTER SERIES CAULFIELD 2025')
        )
       AND eventtype_code = (
        SELECT eventtype_code
          FROM eventtype
         WHERE upper(eventtype_desc) = upper('10 km run')
    )
);
COMMIT;

--(c)
UPDATE entry
   SET event_id = (
    SELECT event_id
      FROM event
     WHERE carn_date = (
            SELECT carn_date
              FROM carnival
             WHERE upper(carn_name) = upper('RM WINTER SERIES CAULFIELD 2025')
        )
       AND eventtype_code = (
        SELECT eventtype_code
          FROM eventtype
         WHERE upper(eventtype_desc) = upper('5 km run')
    )
),
       entry_no = (
           SELECT nvl(
               max(entry_no),
               0
           ) + 1
             FROM entry
            WHERE event_id = (
               SELECT event_id
                 FROM event
                WHERE carn_date = (
                       SELECT carn_date
                         FROM carnival
                        WHERE upper(carn_name) = upper('RM WINTER SERIES CAULFIELD 2025'
                        )
                   )
                  AND eventtype_code = (
                   SELECT eventtype_code
                     FROM eventtype
                    WHERE upper(eventtype_desc) = upper('5 km run')
               )
           )
       ),
       char_id = (
           SELECT char_id
             FROM charity
            WHERE upper(char_name) = upper('Beyond Blue')
       )
 WHERE comp_no = (
        SELECT comp_no
          FROM competitor
         WHERE comp_phone = '0422412524'
    )
   AND event_id = (
    SELECT event_id
      FROM event
     WHERE carn_date = (
            SELECT carn_date
              FROM carnival
             WHERE upper(carn_name) = upper('RM WINTER SERIES CAULFIELD 2025')
        )
       AND eventtype_code = (
        SELECT eventtype_code
          FROM eventtype
         WHERE upper(eventtype_desc) = upper('10 km run')
    )
);
COMMIT;

--(d)
--update all entry of that team_id to null
UPDATE entry
   SET
    team_id = NULL
 WHERE team_id IN (
    SELECT team_id
      FROM team
     WHERE upper(team_name) = upper('Super Runners')
       AND carn_date = (
        SELECT carn_date
          FROM carnival
         WHERE upper(carn_name) = upper('RM WINTER SERIES CAULFIELD 2025')
    )
);

--delete team
DELETE FROM team
 WHERE upper(team_name) = upper('Super Runners')
   AND carn_date = (
    SELECT carn_date
      FROM carnival
     WHERE upper(carn_name) = upper('RM WINTER SERIES CAULFIELD 2025')
);
--delete keith rose
DELETE FROM entry
 WHERE comp_no = (
        SELECT comp_no
          FROM competitor
         WHERE comp_phone = '0422141112' -- Keith Rose's phone
    )
   AND event_id = (
    SELECT event_id
      FROM event
     WHERE carn_date = (
            SELECT carn_date
              FROM carnival
             WHERE upper(carn_name) = upper('RM WINTER SERIES CAULFIELD 2025')
        )
       AND eventtype_code = (
        SELECT eventtype_code
          FROM eventtype
         WHERE upper(eventtype_desc) = upper('10 km run')
    )
);




COMMIT;
/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T5-rm-select.sql

--Student ID: 33520054
--Student Name: Ang Qiao Xin


/* Comments for your marker:




*/


/* (a) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT  t.team_name,
        TO_CHAR(c.carn_date , 'dd-Mon-yyyy') AS carnival_date,
        ld.comp_fname ||' '|| ld.comp_lname AS teamleader,

        /* members of any team id that carries this name
           in this same carnival */
        ( SELECT COUNT(*)
          FROM entry e2
          JOIN team t2  ON t2.team_id  = e2.team_id
          JOIN event ev2 ON ev2.event_id = e2.event_id
          WHERE t2.team_name = t.team_name      -- same name
          AND ev2.carn_date = t.carn_date     -- same carnival
        ) AS team_no_members

FROM team t -- leader row per team/carnival
JOIN carnival c ON c.carn_date = t.carn_date
JOIN entry le ON le.event_id = t.event_id AND le.entry_no = t.entry_no
JOIN competitor ld ON ld.comp_no = le.comp_no

-- most popular name
WHERE t.team_name IN (
    SELECT team_name
    FROM team tt
    JOIN entry ent ON ent.team_id = tt.team_id
    GROUP BY team_name
    HAVING COUNT(*) = (
            SELECT MAX(max_cnt)
            FROM (SELECT COUNT(*) max_cnt
                FROM team  t2
                JOIN entry ex ON ex.team_id = t2.team_id
                GROUP BY t2.team_name )))
ORDER BY t.team_name,c.carn_date;

/* (b) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer






/* (c) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer



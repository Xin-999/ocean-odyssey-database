/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T5-rm-select.sql

--Student ID: 33520054
--Student Name: Ang Qiao Xin


/* Comments for your marker:
I assume the leader is counted as the number of member.
For 5c, because of the rounding, the sum of percentage might not be 100.


*/


/* (a) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT TRIM(t.team_name) AS team_name,
       to_char(
           t.carn_date,
           'dd-Mon-yyyy'
       ) AS carnival_date,
       TRIM(ld.comp_fname)
       || ' '
       || TRIM(ld.comp_lname) AS teamleader,
       (
           SELECT COUNT(*)
             FROM entry e
            WHERE e.team_id = t.team_id
       ) AS team_no_members
  FROM team t
  JOIN entry le
ON le.event_id = t.event_id
   AND le.entry_no = t.entry_no
  JOIN competitor ld
ON ld.comp_no = le.comp_no
 WHERE t.team_name IN (
    SELECT team_name
      FROM team t
     WHERE t.carn_date < sysdate
     GROUP BY team_name
    HAVING COUNT(DISTINCT t.carn_date) = (
        SELECT MAX(cnt)
          FROM (
            SELECT COUNT(DISTINCT t2.carn_date) AS cnt
              FROM team t2
             WHERE t2.carn_date < sysdate
             GROUP BY t2.team_name
        )
    )
)
 ORDER BY t.team_name,
          t.carn_date;


/* (b) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT et.eventtype_desc AS "Event",
       c.carn_name
       || ' held '
       || to_char(
           c.carn_date,
           'Dy dd-Mon-yyyy'
       ) AS "Carnival",
       to_char(
           e.entry_elapsedtime,
           'HH24:MI:SS'
       ) AS "Current Record",
       to_char(
           co.comp_no,
           '00000'
       )
       || ' '
       || TRIM(co.comp_fname)
       || ' '
       || TRIM(co.comp_lname) AS "Competitor No and Name",
       floor(months_between(
           c.carn_date,
           co.comp_dob
       ) / 12) AS "Age at Carnival"
  FROM eventtype et
  JOIN event ev
ON ev.eventtype_code = et.eventtype_code
  JOIN carnival c
ON c.carn_date = ev.carn_date
  JOIN entry e
ON e.event_id = ev.event_id
  JOIN competitor co
ON co.comp_no = e.comp_no
 WHERE e.entry_elapsedtime = (
    SELECT MIN(e2.entry_elapsedtime)
      FROM event ev2
      JOIN entry e2
    ON e2.event_id = ev2.event_id
     WHERE ev2.eventtype_code = ev.eventtype_code
       AND e2.entry_elapsedtime IS NOT NULL
)
 ORDER BY et.eventtype_desc,
          co.comp_no;



/* (c) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT c.carn_name AS "Carnival Name",
       to_char(
           c.carn_date,
           'DD Mon YYYY'
       ) AS "Carnival Date",
       et.eventtype_desc AS "Event Description",
       CASE
           WHEN evt_cnt.cnt IS NULL THEN
               'Not offered'
           ELSE
               lpad(
                   to_char(evt_cnt.cnt),
                   17
               )
       END AS "Number of Entries",
       CASE
           WHEN evt_cnt.cnt IS NULL
               OR all_cnt.total_cnt = 0 THEN
               rpad(
                   ' ',
                   21
               )
           ELSE
               lpad(
                   to_char(round(evt_cnt.cnt * 100 / all_cnt.total_cnt)),
                   21
               )
       END AS "% of Carnival Entries"
  FROM carnival c
 CROSS JOIN eventtype et

--total entries in that carnival
  LEFT JOIN (
    SELECT e.carn_date,
           COUNT(*) AS total_cnt
      FROM event e
      JOIN entry en
    ON en.event_id = e.event_id
     GROUP BY e.carn_date
) all_cnt
ON all_cnt.carn_date = c.carn_date

--entries in that carnival for that event-type
  LEFT JOIN (
    SELECT e.carn_date,
           e.eventtype_code,
           COUNT(*) AS cnt
      FROM event e
      JOIN entry en
    ON en.event_id = e.event_id
     GROUP BY e.carn_date,
              e.eventtype_code
) evt_cnt
ON evt_cnt.carn_date = c.carn_date
   AND evt_cnt.eventtype_code = et.eventtype_code
 ORDER BY c.carn_date,
          evt_cnt.cnt DESC,
          et.eventtype_desc;
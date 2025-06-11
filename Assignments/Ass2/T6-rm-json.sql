/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T6-rm-json.sql

--Student ID: 33520054
--Student Name: Ang Qiao Xin


/* Comments for your marker:
Used trim to ensure no extra space in middle of full name.



*/


-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT
    JSON_OBJECT(
        '_id' VALUE t.team_id,
                'carn_name' VALUE c.carn_name,
                'carn_date' VALUE to_char(
            c.carn_date,
            'dd-Mon-yyyy'
        ),
                'team_name' VALUE t.team_name,
                'team_leader' VALUE
            JSON_OBJECT(
                'name' VALUE
                    CASE
                        WHEN lead.comp_fname IS NULL
                           AND lead.comp_lname IS NULL THEN
                            '-'
                        ELSE
                            nvl(
                                trim(lead.comp_fname),
                                ''
                            )
                            ||
                            CASE
                                WHEN lead.comp_fname IS NOT NULL
                                       AND lead.comp_lname IS NOT NULL THEN
                                        ' '
                                ELSE
                                    ''
                            END
                            || nvl(
                                trim(lead.comp_lname),
                                ''
                            )
                    END,
                        'phone' VALUE lead.comp_phone,
                        'email' VALUE lead.comp_email
            ),
                'team_no_of_members' VALUE COUNT(*),
                'team_members' VALUE JSON_ARRAYAGG(
            JSON_OBJECT(
                'competitor_name' VALUE
                    CASE
                        WHEN mem.comp_fname IS NULL
                           AND mem.comp_lname IS NULL THEN
                            '-'
                        ELSE
                            nvl(
                                trim(mem.comp_fname),
                                ''
                            )
                            ||
                            CASE
                                WHEN mem.comp_fname IS NOT NULL
                                       AND mem.comp_lname IS NOT NULL THEN
                                        ' '
                                ELSE
                                    ''
                            END
                            || nvl(
                                trim(mem.comp_lname),
                                ''
                            )
                    END,
                        'competitor_phone' VALUE mem.comp_phone,
                        'event_type' VALUE et.eventtype_desc,
                        'entry_no' VALUE ent.entry_no,
                        'starttime' VALUE nvl(
                    to_char(
                        ent.entry_starttime,
                        'HH24:MI:SS'
                    ),
                    '-'
                ),
                        'finishtime' VALUE nvl(
                    to_char(
                        ent.entry_finishtime,
                        'HH24:MI:SS'
                    ),
                    '-'
                ),
                        'elapsedtime' VALUE nvl(
                    to_char(
                        ent.entry_elapsedtime,
                        'HH24:MI:SS'
                    ),
                    '-'
                )
            )
         ORDER BY ent.entry_no)
    FORMAT JSON)
    || ','
  FROM team t
  JOIN carnival c
ON c.carn_date = t.carn_date
  JOIN entry e_lead
ON e_lead.event_id = t.event_id
   AND e_lead.entry_no = t.entry_no
  JOIN competitor lead
ON lead.comp_no = e_lead.comp_no
  JOIN entry ent
ON ent.team_id = t.team_id
  JOIN competitor mem
ON mem.comp_no = ent.comp_no
  JOIN event ev
ON ev.event_id = ent.event_id
  JOIN eventtype et
ON et.eventtype_code = ev.eventtype_code
 GROUP BY t.team_id,
          t.team_name,
          c.carn_name,
          c.carn_date,
          lead.comp_fname,
          lead.comp_lname,
          lead.comp_phone,
          lead.comp_email
 ORDER BY t.team_id;
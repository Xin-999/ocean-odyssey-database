/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T2-rm-insert.sql

--Student ID: 33520054
--Student Name: Ang Qiao Xin

/* Comments for your marker:




*/

-- Task 2 Load the COMPETITOR, ENTRY and TEAM tables with your own
-- test data following the data requirements expressed in the brief

-- =======================================
-- COMPETITOR
-- =======================================

INSERT INTO competitor VALUES (1, 'Alice', 'Tan', 'F', TO_DATE('10-03-2000', 'DD-MM-YYYY'), 'alice.tan@student.monash.edu', 'Y', '0412345678');
INSERT INTO competitor VALUES (2, 'Ben', 'Lim', 'M', TO_DATE('22-11-1998', 'DD-MM-YYYY'), 'ben.lim@student.monash.edu', 'Y', '0423456789');
INSERT INTO competitor VALUES (3, 'Chloe', 'Ng', 'F', TO_DATE('15-07-1999', 'DD-MM-YYYY'), 'chloe.ng@student.monash.edu', 'Y', '0434567890');
INSERT INTO competitor VALUES (4, 'David', 'Lee', 'M', TO_DATE('05-05-2001', 'DD-MM-YYYY'), 'david.lee@student.monash.edu', 'Y', '0445678901');
INSERT INTO competitor VALUES (5, 'Ethan', 'Wong', 'U', TO_DATE('30-01-1997', 'DD-MM-YYYY'), 'ethan.wong@student.monash.edu', 'Y', '0456789012');

INSERT INTO competitor VALUES (6, 'Fiona', 'Low', 'F', TO_DATE('03-04-1995', 'DD-MM-YYYY'), 'fiona.low@gmail.com', 'N', '0467890123');
INSERT INTO competitor VALUES (7, 'George', 'Tan', 'M', TO_DATE('18-09-1988', 'DD-MM-YYYY'), 'george.tan@gmail.com', 'N', '0478901234');
INSERT INTO competitor VALUES (8, 'Hannah', 'Kaur', 'F', TO_DATE('25-06-1992', 'DD-MM-YYYY'), 'hannah.kaur@gmail.com', 'N', '0489012345');
INSERT INTO competitor VALUES (9, 'Isaac', 'Chong', 'M', TO_DATE('12-02-1990', 'DD-MM-YYYY'), 'isaac.chong@gmail.com', 'N', '0490123456');
INSERT INTO competitor VALUES (10, 'Jasmine', 'Lim', 'F', TO_DATE('08-08-1985', 'DD-MM-YYYY'), 'jasmine.lim@gmail.com', 'N', '0401234567');

INSERT INTO competitor VALUES (11, 'Kevin', 'Ong', 'M', TO_DATE('14-10-2002', 'DD-MM-YYYY'), 'kevin.ong@gmail.com', 'N', '0411111111');
INSERT INTO competitor VALUES (12, 'Lydia', 'Yap', 'F', TO_DATE('19-01-1996', 'DD-MM-YYYY'), 'lydia.yap@student.monash.edu', 'Y', '0422222222');
INSERT INTO competitor VALUES (13, 'Marcus', 'Goh', 'M', TO_DATE('11-11-1993', 'DD-MM-YYYY'), 'marcus.goh@gmail.com', 'N', '0433333333');
INSERT INTO competitor VALUES (14, 'Nina', 'Tan', 'F', TO_DATE('17-03-1998', 'DD-MM-YYYY'), 'nina.tan@student.monash.edu', 'Y', '0444444444');
INSERT INTO competitor VALUES (15, 'Oscar', 'Chin', 'M', TO_DATE('22-07-2000', 'DD-MM-YYYY'), 'oscar.chin@gmail.com', 'N', '0455555555');


-- =======================================
-- ENTRY
-- =======================================


INSERT INTO entry (event_id, entry_no, entry_starttime, entry_finishtime, entry_elapsedtime, comp_no, team_id, char_id)
VALUES (10, 1, TO_DATE('08:00:44', 'hh24:mi:ss'), TO_DATE('09:04:44', 'hh24:mi:ss'), TO_DATE('1:04:00', 'hh24:mi:ss'), 14, 2, NULL);
INSERT INTO entry (event_id, entry_no, entry_starttime, entry_finishtime, entry_elapsedtime, comp_no, team_id, char_id)
VALUES (13, 2, TO_DATE('08:30:13', 'hh24:mi:ss'), TO_DATE('09:18:13', 'hh24:mi:ss'), TO_DATE('0:48:00', 'hh24:mi:ss'), 14, 3, NULL);
INSERT INTO entry (event_id, entry_no, entry_starttime, entry_finishtime, entry_elapsedtime, comp_no, team_id, char_id)
VALUES (14, 3, TO_DATE('08:00:58', 'hh24:mi:ss'), TO_DATE('08:39:58', 'hh24:mi:ss'), TO_DATE('0:39:00', 'hh24:mi:ss'), 2, 2, NULL);
INSERT INTO entry (event_id, entry_no, entry_starttime, entry_finishtime, entry_elapsedtime, comp_no, team_id, char_id)
VALUES (5, 27, TO_DATE('08:01:12', 'hh24:mi:ss'), TO_DATE('08:51:12', 'hh24:mi:ss'), TO_DATE('0:50:00', 'hh24:mi:ss'), 2, NULL, 1);
INSERT INTO entry (event_id, entry_no, entry_starttime, entry_finishtime, entry_elapsedtime, comp_no, team_id, char_id)
VALUES (8, 4, TO_DATE('08:01:04', 'hh24:mi:ss'), TO_DATE('08:49:04', 'hh24:mi:ss'), TO_DATE('0:48:00', 'hh24:mi:ss'), 11, 3, NULL);
INSERT INTO entry (event_id, entry_no, entry_starttime, entry_finishtime, entry_elapsedtime, comp_no, team_id, char_id)
VALUES (14, 8, TO_DATE('08:00:32', 'hh24:mi:ss'), TO_DATE('08:48:32', 'hh24:mi:ss'), TO_DATE('0:48:00', 'hh24:mi:ss'), 11, 4, NULL);
INSERT INTO entry (event_id, entry_no, entry_starttime, entry_finishtime, entry_elapsedtime, comp_no, team_id, char_id)
VALUES (1, 10, TO_DATE('09:30:15', 'hh24:mi:ss'), TO_DATE('10:09:15', 'hh24:mi:ss'), TO_DATE('0:39:00', 'hh24:mi:ss'), 10, 1, NULL);
INSERT INTO entry (event_id, entry_no, entry_starttime, entry_finishtime, entry_elapsedtime, comp_no, team_id, char_id)
VALUES (6, 11, TO_DATE('08:31:31', 'hh24:mi:ss'), TO_DATE('09:35:31', 'hh24:mi:ss'), TO_DATE('1:04:00', 'hh24:mi:ss'), 10, 1, NULL);
INSERT INTO entry (event_id, entry_no, entry_starttime, entry_finishtime, entry_elapsedtime, comp_no, team_id, char_id)
VALUES (7, 12, TO_DATE('08:31:13', 'hh24:mi:ss'), TO_DATE('09:06:13', 'hh24:mi:ss'), TO_DATE('0:35:00', 'hh24:mi:ss'), 8, 5, NULL);
INSERT INTO entry (event_id, entry_no, entry_starttime, entry_finishtime, entry_elapsedtime, comp_no, team_id, char_id)
VALUES (1, 13, TO_DATE('09:31:03', 'hh24:mi:ss'), TO_DATE('10:07:03', 'hh24:mi:ss'), TO_DATE('0:36:00', 'hh24:mi:ss'), 8, 5, NULL);
INSERT INTO entry (event_id, entry_no, entry_starttime, entry_finishtime, entry_elapsedtime, comp_no, team_id, char_id)
VALUES (6, 5, TO_DATE('08:31:06', 'hh24:mi:ss'), TO_DATE('09:13:06', 'hh24:mi:ss'), TO_DATE('0:42:00', 'hh24:mi:ss'), 10, 3, NULL);
INSERT INTO entry (event_id, entry_no, entry_starttime, entry_finishtime, entry_elapsedtime, comp_no, team_id, char_id)
VALUES (12, 28, TO_DATE('08:46:06', 'hh24:mi:ss'), TO_DATE('09:30:06', 'hh24:mi:ss'), TO_DATE('0:44:00', 'hh24:mi:ss'), 10, NULL, 4);
INSERT INTO entry (event_id, entry_no, entry_starttime, entry_finishtime, entry_elapsedtime, comp_no, team_id, char_id)
VALUES (13, 6, TO_DATE('08:31:27', 'hh24:mi:ss'), TO_DATE('09:35:27', 'hh24:mi:ss'), TO_DATE('1:04:00', 'hh24:mi:ss'), 9, NULL, NULL);
INSERT INTO entry (event_id, entry_no, entry_starttime, entry_finishtime, entry_elapsedtime, comp_no, team_id, char_id)
VALUES (9, 7, TO_DATE('08:01:57', 'hh24:mi:ss'), TO_DATE('08:55:57', 'hh24:mi:ss'), TO_DATE('0:54:00', 'hh24:mi:ss'), 4, NULL, 4);
INSERT INTO entry (event_id, entry_no, entry_starttime, entry_finishtime, entry_elapsedtime, comp_no, team_id, char_id)
VALUES (12, 9, TO_DATE('08:46:27', 'hh24:mi:ss'), TO_DATE('09:46:27', 'hh24:mi:ss'), TO_DATE('1:00:00', 'hh24:mi:ss'), 7, NULL, 4);
INSERT INTO entry (event_id, entry_no, entry_starttime, entry_finishtime, entry_elapsedtime, comp_no, team_id, char_id)
VALUES (11, 14, TO_DATE('07:46:15', 'hh24:mi:ss'), TO_DATE('08:32:15', 'hh24:mi:ss'), TO_DATE('0:46:00', 'hh24:mi:ss'), 1, 2, NULL);
INSERT INTO entry (event_id, entry_no, entry_starttime, entry_finishtime, entry_elapsedtime, comp_no, team_id, char_id)
VALUES (8, 15, TO_DATE('08:00:25', 'hh24:mi:ss'), TO_DATE('08:29:25', 'hh24:mi:ss'), TO_DATE('0:29:00', 'hh24:mi:ss'), 9, 1, NULL);
INSERT INTO entry (event_id, entry_no, entry_starttime, entry_finishtime, entry_elapsedtime, comp_no, team_id, char_id)
VALUES (1, 16, TO_DATE('09:31:11', 'hh24:mi:ss'), TO_DATE('10:05:11', 'hh24:mi:ss'), TO_DATE('0:34:00', 'hh24:mi:ss'), 14, 5, NULL);
INSERT INTO entry (event_id, entry_no, entry_starttime, entry_finishtime, entry_elapsedtime, comp_no, team_id, char_id)
VALUES (11, 17, TO_DATE('07:45:42', 'hh24:mi:ss'), TO_DATE('08:40:42', 'hh24:mi:ss'), TO_DATE('0:55:00', 'hh24:mi:ss'), 12, 2, NULL);
INSERT INTO entry (event_id, entry_no, entry_starttime, entry_finishtime, entry_elapsedtime, comp_no, team_id, char_id)
VALUES (4, 18, TO_DATE('08:30:18', 'hh24:mi:ss'), TO_DATE('08:56:18', 'hh24:mi:ss'), TO_DATE('0:26:00', 'hh24:mi:ss'), 5, NULL, 2);
INSERT INTO entry (event_id, entry_no, entry_starttime, entry_finishtime, entry_elapsedtime, comp_no, team_id, char_id)
VALUES (1, 19, TO_DATE('09:30:46', 'hh24:mi:ss'), TO_DATE('10:14:46', 'hh24:mi:ss'), TO_DATE('0:44:00', 'hh24:mi:ss'), 6, NULL, 2);
INSERT INTO entry (event_id, entry_no, entry_starttime, entry_finishtime, entry_elapsedtime, comp_no, team_id, char_id)
VALUES (10, 20, TO_DATE('08:00:06', 'hh24:mi:ss'), TO_DATE('09:04:06', 'hh24:mi:ss'), TO_DATE('1:04:00', 'hh24:mi:ss'), 5, 2, NULL);
INSERT INTO entry (event_id, entry_no, entry_starttime, entry_finishtime, entry_elapsedtime, comp_no, team_id, char_id)
VALUES (6, 21, TO_DATE('08:30:48', 'hh24:mi:ss'), TO_DATE('09:12:48', 'hh24:mi:ss'), TO_DATE('0:42:00', 'hh24:mi:ss'), 11, NULL, 4);
INSERT INTO entry (event_id, entry_no, entry_starttime, entry_finishtime, entry_elapsedtime, comp_no, team_id, char_id)
VALUES (2, 22, TO_DATE('08:31:51', 'hh24:mi:ss'), TO_DATE('08:58:51', 'hh24:mi:ss'), TO_DATE('0:27:00', 'hh24:mi:ss'), 2, NULL, NULL);
INSERT INTO entry (event_id, entry_no, entry_starttime, entry_finishtime, entry_elapsedtime, comp_no, team_id, char_id)
VALUES (11, 23, TO_DATE('07:45:45', 'hh24:mi:ss'), TO_DATE('08:25:45', 'hh24:mi:ss'), TO_DATE('0:40:00', 'hh24:mi:ss'), 8, NULL, 2);
INSERT INTO entry (event_id, entry_no, entry_starttime, entry_finishtime, entry_elapsedtime, comp_no, team_id, char_id)
VALUES (4, 24, TO_DATE('08:30:38', 'hh24:mi:ss'), TO_DATE('09:25:38', 'hh24:mi:ss'), TO_DATE('0:55:00', 'hh24:mi:ss'), 14, NULL, 1);
INSERT INTO entry (event_id, entry_no, entry_starttime, entry_finishtime, entry_elapsedtime, comp_no, team_id, char_id)
VALUES (4, 25, TO_DATE('08:31:25', 'hh24:mi:ss'), TO_DATE('09:21:25', 'hh24:mi:ss'), TO_DATE('0:50:00', 'hh24:mi:ss'), 1, NULL, 4);
INSERT INTO entry (event_id, entry_no, entry_starttime, entry_finishtime, entry_elapsedtime, comp_no, team_id, char_id)
VALUES (4, 26, TO_DATE('08:30:38', 'hh24:mi:ss'),NULL, NULL, 4, 5, NULL);
INSERT INTO entry (event_id, entry_no, entry_starttime, entry_finishtime, entry_elapsedtime, comp_no, team_id, char_id)
VALUES (7, 29, NULL, NULL, NULL, 6, 3, 1);
INSERT INTO entry (event_id, entry_no, entry_starttime, entry_finishtime, entry_elapsedtime, comp_no, team_id, char_id)
VALUES (9, 30, NULL, NULL, NULL, 13, 2, 1);
-- =======================================
-- TEAM
-- =======================================


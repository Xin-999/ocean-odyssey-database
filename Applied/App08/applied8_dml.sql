/*
Databases Applied 8
applied8_dml.sql

student id: 33520054
student name:
last modified date:

*/

---==INSERT==--
/*1. Write SQL INSERT statements to add the data into the specified tables */
INSERT into student VALUES
(
11111111,    'Bloggs',      'Fred',        to_date('1-Jan-2003', 'dd-Mon-yyyy')
);
insert into unit VALUES
(
'FIT9132',    'Introduction to Databases'
);
insert into enrolment VALUES
(
    11111111,    'FIT9132',     TO_DATE('2022','yyyy' ),       1,               35,          'N'
);
COMMIT;
---==INSERT using SEQUENCEs ==--
/*1. Create a sequence for the STUDENT table called STUDENT_SEQ */
drop sequence STUDENT_SEQ;
create SEQUENCE STUDENT_SEQ start with 11111115 increment by 1;
/*2. Add a new student (MICKEY MOUSE) and an enrolment for this student as listed below, 
treat all the data that you add as a single transaction. 
current val , make sure next val and curent val tgt commit*/
INSERT into student VALUES
(
    STUDENT_SEQ.NEXTVAL,    'MOUSE',      'MICKEY',        to_date('1-Jan-2003', 'dd-Mon-yyyy')
);
insert into enrolment VALUES
(
    STUDENT_SEQ.currval,    'FIT9132',     TO_DATE('2022','yyyy' ),       1,               null,          null
);
COMMIT;


---==Advanced INSERT==--
/*1. A new student has started a course. Subsequently this new student needs to enrol into 
Introduction to databases. Enter the new student's details, then insert his/her enrollment 
to the database using the sequence in combination with a SELECT statement. You can 
make up details of the new student and when they will attempt Introduction to databases 
and you may assume there is only one student with such a name in the system.

You must not do a manual lookup to find the unit code of the Introduction to Databases 
and the student number.
 */
INSERT into student VALUES
(
    STUDENT_SEQ.NEXTVAL,    'MOUSE',      'MINNIE',        to_date('1-Jan-2003', 'dd-Mon-yyyy')
);
commit;
insert into enrolment VALUES

(
    (select stu_nbr from student where upper(stu_lname) = upper('Mouse') and upper(stu_fname) =upper('Minnie')),
    (select unit_code from unit where upper(unit_name) = upper('Introduction to Databases')),     
    TO_DATE('2022','yyyy' ),       1,               null,          null
);
COMMIT;

---=Creating a table and inserting data as a single SQL statement==--
/*1. Create a table called FIT5111_STUDENT. The table should contain all enrolments for the 
unit FIT5111 */
drop table FIT9132_STUDENT cascade CONSTRAINT purge;
create table FIT9132_STUDENT as select * from enrolment where upper(unit_code) = 'FIT9132'
/*2. Check the table exists */

select * from cat;

/*3. List the contents of the table */
select * from FIT9132_STUDENT;
---==8.2.5 UPDATE==--
/*1. Update the unit name of FIT9999 from 'FIT Last Unit' to 'place holder unit'.*/
update unit set unit_name = 'place holder unit' where upper(unit_code) = 'FIT9999'
commit;
/*2. Enter the mark and grade for the student with the student number of 11111113 
for Introduction to Databases that the student enrolled in semester 1 of 2023. 
The mark is 75 and the grade is D.*/
update enrolment set enrol_mark = 75, enrol_grade = 'D' where stu_nbr=11111113
and enrol_semester = 1 and enrol_year = to_date('2023', 'yyyy')
and unit_code = (select unit_code from unit where upper(unit_name) = upper('Introduction to Databases'));
commit;
/*3. The university introduced a new grade classification scale. 
The new classification are: *want update now so 6 tgt 1 commit
0 - 44 is N
45 - 54 is P1
55 - 64 is P2
65 - 74 is C
75 - 84 is D
85 - 100 is HD
Change the database to reflect the new grade classification scale.
*/
update enrolment set enrol_grade = 'N' where enrol_mark between 0 and 44;
update enrolment set enrol_grade = 'P1' where enrol_mark between 45 and 54;
update enrolment set enrol_grade = 'N' where enrol_mark between 0 and 44;
update enrolment set enrol_grade = 'N' where enrol_mark between 0 and 44;
commit;

/*4. Due to the new regulation, the Faculty of IT decided to change 'Project' unit code 
from FIT9161 into FIT5161. Change the database to reflect this situation.
Note: you need to disable the FK constraint before you do the modification 
then enable the FK to have it active again.
*/
ALTER TABLE enrolment
        [DISABLE] CONSTRAINT unit_enrolmenet_fk;
update unit set unit_code = 'FIT5161' where upper(unit_code) = 'FIT9161';
update enrolment set unit_code = 'FIT5161 'where upper(unit_code) = 'FIT9161';
commit;
ALTER TABLE enrolment
        [ENABLE] CONSTRAINT unit_enrolmenet_fk;


--==DELETE==--
/*1. A student with student number 11111114 has taken intermission in semester 1 2023, 
hence all the enrolment of this student for semester 1 2023 should be removed. 
Change the database to reflect this situation.*/
delete from enrolment where stu_nbr = '11111114' and enrol_semester = 1 and
enrol_year = to_date('2023,' 'yyyy');
commit;

/*2. The faculty decided to remove all Student's Life unit's enrolments. 
Change the database to reflect this situation. need run applied 7 yo
Note: unit names are unique in the database.*/
delete from unit where upper(unit_name) = upper('Student''s Life');
commit;

/*3. Assume that Wendy Wheat (student number 11111113) has withdrawn from the university. 
Remove her details from the database.
cause its restrict in aplied 7, so need start from child first then delete parent*/
delete from enrolment where stu_nbr = '11111113';
delete from student where stu_nbr = '11111113' ;
commit;


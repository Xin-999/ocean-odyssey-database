/*
Databases Applied 7
applied7_schema.sql

student id: 
student name:
last modified date:

*/

-- DDL for Student-Unit-Enrolment model (using ALTER TABLE)
--

--
-- Place DROP commands at head of schema file
--
drop table enrolment purge;
drop table course_unit purge; --here cause drop child first before unit and course
drop table unit purge;
drop table student purge;
drop table course purge;

-- Create Tables
-- Here using both table and column constraints
--

CREATE TABLE student (
    stu_nbr     NUMBER(8) NOT NULL,
    stu_lname   VARCHAR2(50),
    stu_fname   VARCHAR2(50),
    stu_dob     DATE NOT NULL
);

COMMENT ON COLUMN student.stu_nbr IS
    'Student number';

COMMENT ON COLUMN student.stu_lname IS
    'Student last name';

COMMENT ON COLUMN student.stu_fname IS
    'Student first name';

COMMENT ON COLUMN student.stu_dob IS
    'Student date of birth';

/* Add STUDENT constraints here */
alter table student add constraint student_pk primary key(stu_nbr);
alter table student add constraint chk_stu_nbr check (stu_nbr > 10000000);

/* Add UNIT data types here */
CREATE TABLE unit (
    unit_code  char(7) not null  ,
    unit_name  varchar2(50) not null
);

COMMENT ON COLUMN unit.unit_code IS
    'Unit code';

COMMENT ON COLUMN unit.unit_name IS
    'Unit name';

/* Add UNIT constraints here */
alter table unit add constraint unit_pk primary key(unit_code);
alter table unit add constraint un_uni_name unique(unit_name);
/* Add ENROLMENT attributes and data types here */
CREATE TABLE enrolment (
    stu_nbr  NUMBER(8) not null,
    unit_code  CHAR(7) not null,
    enrol_year DATE not null,
    enrol_semester CHAR(1) not null,
    enrol_mark  NUMBER(3),
    enrol_grade  VARCHAR2(2)
    
);

COMMENT ON COLUMN enrolment.stu_nbr IS
    'Student number';

COMMENT ON COLUMN enrolment.unit_code IS
    'Unit code';

COMMENT ON COLUMN enrolment.enrol_year IS
    'Enrolment year';

COMMENT ON COLUMN enrolment.enrol_semester IS
    'Enrolment semester';

COMMENT ON COLUMN enrolment.enrol_mark IS
    'Enrolment mark (real)';

COMMENT ON COLUMN enrolment.enrol_grade IS
    'Enrolment grade (letter)';

/* Add ENROLMENT constraints here */
alter table enrolment add constraint enrolment_pk primary key (stu_nbr, unit_code, enrol_year, enrol_semester);
alter table enrolment add constraint unit_enrolment_fk foreign key(unit_code)REFERENCES unit(unit_code);
alter table enrolment add constraint student_enrolment_fk foreign key(stu_nbr)REFERENCES student(stu_nbr);

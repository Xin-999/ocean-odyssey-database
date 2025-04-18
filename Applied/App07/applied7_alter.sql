/* Q1 A7-3 */

-- drop table course purge; can put here also it depends

alter table unit 
add unit_creditpoints NUMBER(2) default 6 not NULL;

alter table unit add CONSTRAINT ucp_check
check(unit_creditpoints in (3,6,12));

COMMENT ON COLUMN unit.unit_creditpoints IS
    'Unit credit points';

CREATE TABLE course (
    course_code CHAR(5) not null ,
    course_name VARCHAR2(50) NOT NULL,
    course_total_points NUMBER(3) not null
);

-- course - unit
-- many to many
-- create another table to have a bridge because their relationship is many to many 
-- remember your column comment and dont commit 
create table couse_unit(
    course_code CHAR(5) not null,
    unit_code char(7) not null,
    constraint course_unit primary key(course_code, unit_code),
    constraint course_unit_fk1 foreign key(course_code) REFERENCES course(course_code),
    constraint course_unit_fk2 foreign key(unit_code) REFERENCES unit(unit_code)
);


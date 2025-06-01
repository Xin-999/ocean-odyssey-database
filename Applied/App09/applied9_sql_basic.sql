/*
Database Teaching Team
applied9_sql_basic.sql

student id: 33520054
student name:
last modified date:

*/

/* Part A - Retrieving data from a single table */

-- A1
select stuid, stulname, stufname, stuaddress
from uni.STUDENT
where upper(stulname) like 'S%'
and lower(stufname) like '%i%'
order by stuid;

-- A2
select stuid,  stulname, stufname, stuaddress
from uni.STUDENT
where upper(STUADDRESS) like '%CAULFIELD'
order by stuid;

-- A3
select  stuid,  stulname as lastname,stufname as firstname, to_char(studob, 'dd-Mon-yyyy'),stuaddress
, stuphone, stuemail
from uni.student
where stulname like 'M%'
order by stuid;

-- A4
select  stuid,  stulname as lastname,stufname as firstname, to_char(studob, 'dd-Mon-yyyy'),stuaddress
, stuphone, stuemail
from uni.student
where stulname like 'S%'
and stufname like '%i%'
order by stuid;

-- A5
select unitcode,unitname,unitdesc
from uni.unit
where unitcode like 'FIT1%'
order by unitcode;

-- A6
select unitcode, ofsemester
from uni.OFFERING
where to_char(ofyear,'yyyy') = '2021'
order by unitcode, ofsemester;

-- A7
select to_char(ofyear, 'yyyy') as year, unitcode, ofsemester
from uni.OFFERING
where ofsemester = '2'
and (to_char(ofyear, 'yyyy') = '2020'
or to_char(ofyear, 'yyyy') = '2019')
order by year, unitcode;

SELECT
    to_char(
        ofyear, 'yyyy'
    ) AS offering_year,
    unitcode
FROM
    uni.offering
WHERE
    ofsemester = 2
    AND ( ( to_char(
        ofyear, 'yyyy'
    ) = '2019' )
          OR ( to_char(
        ofyear, 'yyyy'
    ) = '2020' ) )
ORDER BY
    offering_year,
    unitcode;

-- A8
select stuid, unitcode,enrolmark
from uni.ENROLMENT
where ofsemester = 2
and to_char(ofyear, 'yyyy') = '2021'
and enrolmark < 50
order by stuid, unitcode;

-- A9
select stuid,enrolmark
from uni.ENROLMENT
where ofsemester = 1
and to_char(ofyear, 'yyyy') = '2020'
and enrolmark is null
and enrolgrade is null
and upper(unitcode) = 'FIT3176'
order by stuid;

/* Part B - Retrieving data from multiple tables */

-- B1 join on
select unitcode, ofsemester,
stafffname, stafflname
from uni.OFFERING join uni.STAFF
on uni.offering.staffid = uni.staff.staffid
where to_char(ofyear, 'yyyy') = '2021'
order by ofsemester, unitcode;

-- rename, shorter
select unitcode, ofsemester,
stafffname, stafflname
from uni.OFFERING o join uni.STAFF s
on o.staffid = s.staffid
where to_char(ofyear, 'yyyy') = '2021'
order by ofsemester, unitcode;

--join with using   --same PK, FK to join
select unitcode, ofsemester,
stafffname, stafflname
from uni.OFFERING join uni.STAFF
using(staffid) --here babe
where to_char(ofyear, 'yyyy') = '2021'
order by ofsemester, unitcode;

--join with natural join
select unitcode, ofsemester,
stafffname, stafflname
from uni.OFFERING
natural join uni.staff
where to_char(ofyear, 'yyyy') = '2021'
order by ofsemester, unitcode;

-- B2
select unitcode, unitname, ofyear, ofsemester
from uni.unit
join uni.enrolment using(unitcode)
where to_char(ofyear, 'yyyy') = '2021'
order by ofsemester, unitcode;



-- B3
select stuid,
stufname || ' ' || stulname as "student name", -- only place double quotation when name is 2 word
unitname
from uni.student
join uni.enrolment using(stuid)
join uni.unit using(unitcode)
where ofsemester = 1
and to_char(ofyear, 'yyyy') = '2021'
 
order by unitname, stuid;

-- B4
select stuid, 
stufname || ' ' || stulname as "student name"
from uni.student
join uni.enrolment using (stuid)
where upper(unitcode) = 'FIT9132' and
ofsemester = 2 and 
to_char(ofyear, 'yyyy') = '2019'
and enrolmark >= 80 and enrolmark <=100
order by "student name", stuid;

-- B5
select unitcode, ofsemester, cltype,clday, cltime, clduration
from uni.SCHEDCLASS
join uni.staff using(staffid)
where upper(stafffname) = upper('Windham')
and upper(stafflname) = upper('Ellard')
and to_char(ofyear, 'yyyy') = '2021'
order by unitcode, ofsemester;


-- B6
select unitcode, unitname,
ofsemester,
to_char(ofyear, 'yyyy') as year,
nvl(to_char(enrolmark,'990'), 'N/A') as mark, -- 9 is optional, 0 is mandatory.
-- 000, 7 --> 007
-- 900 , 55 --> 55, 7--> 07 most row is 2 digit, no 1 digit
-- 990, 7--> 7
nvl(enrolgrade, 'N/A') as grade
from uni.unit 
join uni.enrolment using(unitcode)
join uni.student using(stuid)
where upper(stufname) = upper('Brier')
and upper(stulname) =  upper('Kilgour')
order by year, ofsemester, unitcode; -- year is new name can use in order by ONLY

select unitcode, unitname, ofsemester, to_char(ofyear, 'yyyy') as year_study, 
 nvl(to_char(enrolmark), 'N/A') as mark, nvl(enrolgrade, 'N/A') as grade
from uni.ENROLMENT join uni.student using(stuid)
join uni.unit using(unitcode)
where stufname = 'Brier' -- chk upper
and stulname = 'Kilgour'
order by year_study, ofsemester, unitcode;

-- B7
select u1.unitcode,u1.unitname, u2.unitcode as prereq_code,u2.unitname as prereq_name
from uni.unit u1 
    join uni.prereq p 
        on u1.unitcode = p.unitcode 
    join uni.unit u2 
        on u2.unitcode = p.PREREQUNITCODE
order by u1.unitcode,u2.unitcode;

-- B8
select u2.unitcode as prereq_code, u2.unitname as prereq_name
from uni.unit u1 
    join uni.prereq p on u1.unitcode = p.unitcode
    join uni.unit u2 on u2.unitcode = p.PREREQUNITCODE
where u1.unitname = 'Introduction to data science' -- rmb to upper both side for this kind
order by u2.unitcode;

-- B9
select stuid, stufname,stulname
from uni.student join uni.enrolment using(stuid)
where enrolgrade = 'HD'
and upper(unitcode) = 'FIT2094'
and ofsemester = '2'
and to_char(ofyear, 'yyyy') = '2021'
order by stuid;

-- B10
select  stufname || ' ' || stulname as full_name, unitcode
from uni.student join uni.enrolment using(stuid)
where enrolmark is null
and ofsemester = '1'
and to_char(ofyear, 'yyyy') = '2021'
order by full_name;


--practice
select * 
from uni.unit
order by unitcode;

--a2
select to_char(studob,'dd-Mon-yyyy')
from uni.STUDENT
where upper(stuaddress) like upper('%Caulfield')
order by stuid;

select stuid, stufname as firstname, stulname as lastname, studob
from uni.student
where upper(stufname) like 'M%'
order by stuid;

select *
from uni.unit
where unitcode like 'FIT1%'
order by unitcode;

select unitcode, ofsemester
from uni.OFFERING
where to_char(ofyear,'yyyy') = '2021'
order by unitcode, ofsemester;

select to_char(ofyear,'yyyy'), unitcode
from uni.OFFERING
where (to_char(ofyear,'yyyy') = '2020'
and ofsemester = '2')
OR to_char(ofyear,'yyyy') = '2019'
and ofsemester = '1'
order by unitcode, ofsemester;

select stuid, unitcode, enrolmark
from uni.Enrolment
where ofsemester = '2'
and to_char(ofyear,'yyyy') = '2021'
and enrolmark < 50
order by stuid, unitcode;

select stuid, enrolmark
from uni.enrolment
where enrolmark is null
and enrolgrade is null;

--b1
select unitcode, ofsemester, stafffname || ' ' || stafflname as names
from uni.staff join uni.offering using(staffid)
where to_char(ofyear, 'yyyy') = '2021'
order by ofsemester, unitcode
;

select unitcode, unitname, to_char(ofyear, 'yyyy') as year, ofsemester
from uni.offering join uni.unit using(unitcode)
order by unitcode,year, ofsemester;

select stuid, stufname || ' '|| stulname as stu_name, unitname
from uni.enrolment join uni.student using(stuid)
join uni.unit using(unitcode)
where ofsemester = 1 and to_char(ofyear, 'yyyy') = '2021'
order by unitname, stuid;

select stuid, stufname || ' '|| stulname as stu_name
from uni.student join uni.enrolment using(stuid)
where enrolmark >=80 and enrolmark<=100 and
upper(unitcode) = 'FIT9132' and
 ofsemester = 2 and to_char(ofyear, 'yyyy') = '2019'
 order by stu_name, stuid;

select unitcode, ofsemester, cltype, to_char(cltime, 'dd-Mon-yyyy'),clduration
from uni.schedclass join uni.staff using(staffid)
where upper(stafffname) = upper('Windham')and upper(stafflname) = upper('ellard')
and to_char(ofyear, 'yyyy') = '2021';

select unitcode, unitname, ofsemester, to_char(ofyear,'yyyy') as Year, 
nvl(to_char(enrolmark, '999'), 'N/A'), nvl(to_char(enrolgrade), 'N/A')
from uni.student join uni.enrolment using(stuid)
join uni.unit using(unitcode)
where upper(stufname) = upper('Brier') and upper(stulname) =upper('Kilgour')
order by Year, ofsemester, unitcode;

select u1.unitcode, u1.unitname,u2.unitcode, u2.unitname
from uni.unit u1
    join uni.prereq p1 on u1.unitcode = p1.unitcode
    join uni.unit u2 on u2.unitcode = p1.PREREQUNITCODE
order by u1.unitcode, u2.unitcode
; 

select u2.unitcode, u2.unitname
from uni.unit u1
    join uni.prereq p1 on u1.unitcode = p1.unitcode
    join uni.unit u2 on u2.unitcode = p1.PREREQUNITCODE
where upper(u1.unitname) = upper('Introduction to data science')
order by u2.unitcode
;
select * from uni.prereq;
select * from uni.unit;

select stuid, stufname, stulname
from uni.student join uni.enrolment e using(stuid)
join uni.offering using(unitcode)
where upper(enrolgrade) = 'HD'
and upper(unitcode) = 'FIT2094'
and e.ofsemester = 2 and to_char(e.ofyear, 'yyyy') = '2021'
order by stuid;


select stufname, stulname, unitcode
from uni.student join uni.enrolment using(stuid)
where enrolmark is null 
and ofsemester = 1 and to_char(ofyear, 'yyyy') = '2021';

----------------w10 applied
select max(enrolmark)
from uni.enrolment
where upper(unitcode) = 'FIT9136'
and ofsemester = 2 and to_char(ofyear, 'yyyy') = '2019';

select to_char(avg(enrolmark), '999.00') as average_mark
from uni.enrolment;

select avg(enrolmark), to_char(ofyear, 'yyyy') as year, ofsemester
from uni.ENROLMENT
where unitcode = 'FIT9136'
group by to_char(ofyear, 'yyyy'), ofsemester
order by year, ofsemester;

select count(stuid)
from uni.enrolment
where upper(unitcode) = 'FIT1045'
    AND to_char(ofyear, 'YYYY') = '2019'
;

select count(distinct stuid)
from uni.enrolment
where upper(unitcode) = 'FIT1045'
    AND to_char(ofyear, 'YYYY') = '2019'
;

;
select unitcode, count(prerequnitcode)
from uni.prereq
group by unitcode;


select unitcode,count(stuid) as num_stu
from uni.enrolment
where upper(enrolgrade) = 'WH'
and ofsemester = 2
    AND to_char(ofyear, 'yyyy') = '2020'
group by unitcode
order by num_stu DESC
;

SELECT
    prerequnitcode AS unitcode,
    u.unitcode
    u.unitname,
    COUNT(u.unitcode) AS no_times_used
FROM
    uni.prereq p
    JOIN uni.unit u ON u.unitcode = p.prerequnitcode
GROUP BY
    prerequnitcode, u.unitcode,
    u.unitname
ORDER BY
    u.unitcode;

SELECT
    prerequnitcode AS unitcode,
    u.unitname,
    COUNT(u.unitcode) AS no_times_used
FROM
    uni.prereq   p
    JOIN uni.unit     u ON u.unitcode = p.prerequnitcode
GROUP BY
    prerequnitcode,
    u.unitname
ORDER BY
    unitcode;


select unitcode, unitname
from uni.enrolment
join uni.unit using(unitcode)
where 
    ofsemester = 2
    AND to_char(ofyear, 'yyyy') = '2021'
    AND upper(enrolgrade) = 'DEF'
group by unitcode, unitname
having count(*)>=2


    ;

SELECT
    unitcode,
    unitname
FROM
         uni.enrolment
    NATURAL JOIN uni.unit
WHERE
        ofsemester = 2
    AND to_char(ofyear, 'yyyy') = '2021'
    AND upper(enrolgrade) = 'DEF'
GROUP BY
    unitcode,
    unitname
HAVING
    COUNT(*) >= 2
ORDER BY
    unitcode;





    






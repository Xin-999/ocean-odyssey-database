/*
Database Teaching Team
applied10_sql_intermediate.sql

student id: 33520054
student name:
last modified date:

*/

--1, rename 2 work double quotation
select max(enrolmark) as maximum_mark
from uni.ENROLMENT
where ofsemester = 2
and to_char(ofyear,'yyyy') = '2019'
and upper(unitcode) = 'FIT9136';


--2
select to_char(avg(enrolmark),'990.00') as average_mark
from uni.ENROLMENT
where ofsemester = 2
and to_char(ofyear,'yyyy') = '2020'
and upper(unitcode) = 'FIT2094';

--3
select to_char(avg(enrolmark),'990.00') as avg_mark, 
to_char(ofyear,'yyyy') as year, ofsemester
from UNI.ENROLMENT
where upper(unitcode) = 'FIT9136'
group BY to_char(ofyear,'yyyy'), to_char(ofyear,'yyyy'), ofsemester
-- having 
order by year, ofsemester;

select to_char(ofyear, 'yyyy') as year,
ofsemester,
to_char(avg(enrolmark),'990.00') as average_mark
from uni.enrolment
where upper(unitcode) = 'FIT9136'
group by  to_char(ofyear,'yyyy'), ofsemester
order by year, ofsemester;
--4
-- a. 
select count(stuid) as count_stu
from uni.STUDENT s 
JOIN uni.enrolment e ON s.stuid = e.stuid
where upper(unitcode) = 'FIT1045'
and to_char(ofyear,'yyyy') = '2019';

select count(stuid) as count_stu
from uni.ENROLMENT
where upper(unitcode) = 'FIT1045'
and to_char(ofyear,'yyyy') = '2019';

-- b. Repeat students are only counted once across 2019
select count(distinct stuid) as count_stu
from uni.ENROLMENT
where upper(unitcode) = 'FIT1045'
and to_char(ofyear,'yyyy') = '2019';

--5
select count(prerequnitcode) as count_preReq
from uni.PREREQ
where upper(unitcode) = 'FIT5145';

--6
select unitcode, ofsemester, count(unitcode) as count_unit
from uni.ENROLMENT
where to_char(ofyear,'yyyy') = '2019'
group by unitcode, ofsemester
order by count_unit, unitcode,ofsemester;

--7
select unitcode, count(prerequnitcode) as count_preReq
from uni.PREREQ
group by unitcode;

--8
select count(stuid)
from uni.ENROLMENT
where to_char(ofyear,'yyyy') = '2020'
and 
 upper(enrolgrade) = 'DEF';


--9, fit2094 as prereq is used 1 time
select prerequnitcode,unitname, count(p.unitcode) as count_unicode
from uni.PREREQ p
join uni.unit u on prerequnitcode = u.unitcode
group by prerequnitcode, unitname
order by PREREQUNITCODE;


--10
select unitcode, unitname,count(stuid)
from uni.enrolment e
join uni.unit using (unitcode)
where ofsemester = 2
and to_char(ofyear, 'yyyy') = 2021
and upper(enrolgrade) = 'DEF'
group by unitcode, unitname
having count(stuid) >=2
order by unitcode;

--11 subquery
select stuid, stufname || ' ' || stulname as "full name",
to_char(studob, 'dd-mm-yyyy') as DOB
from uni.student
    join uni.enrolment using(stuid)
where upper(unitcode) = 'FIT9132'
and studob = (
    select min(studob)
    from uni.student
    join uni.enrolment using(stuid)
    where upper(unitcode) = 'FIT9132'
    )
order by stuid
;

--12
select unitcode, ofsemester, count(stuid) as no_of_student
from uni.enrolment 
where to_char(ofyear, 'yyyy') = '2019'
group by ofsemester, unitcode
having count(stuid)=(
    select max(count(stuid))
    from uni.enrolment
    where to_char(ofyear, 'yyyy') = '2019'
    group by ofsemester, unitcode
)
order by ofsemester, unitcode

;


--13
SELECT stufname || ' ' || stulname as stuName, 
enrolmark
from uni.ENROLMENT 
    join uni.student using(stuid)
where ofsemester = '1' 
and to_char(ofyear, 'yyyy') = '2020'
and upper(unitcode) = 'FIT3157'
and enrolmark>=(
    select avg(enrolmark)
    from uni.enrolment
    where ofsemester = '1' 
    and to_char(ofyear, 'yyyy') = '2020'
    and upper(unitcode) = 'FIT3157'
)
-- group by stufname || ' ' || stulname 
-- having enrolmark >= (
    
-- )
order by enrolmark desc, stuName
;

SELECT
    stufname || ' ' || stulname as student_name,
    enrolmark
FROM
    uni.student     s
    JOIN uni.enrolment   e ON s.stuid = e.stuid
WHERE
    upper(unitcode) = 'FIT3157'
    AND ofsemester = 1
    AND to_char(ofyear, 'YYYY') = '2020'
    AND enrolmark > (
        SELECT
            AVG(enrolmark)
        FROM
            uni.enrolment
        WHERE
            upper(unitcode) = 'FIT3157'
            AND ofsemester = 1
            AND to_char(ofyear, 'YYYY') = '2020'
    )
ORDER BY
    enrolmark DESC, student_name;




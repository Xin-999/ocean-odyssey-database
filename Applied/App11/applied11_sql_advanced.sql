/*
Database Teaching Team
applied11_sql_advanced.sql

student id: 33520054
student name:
last modified date:

*/
--1
select unitcode, unitname,
to_char(ofyear, 'yyyy') as year,
ofsemester,
enrolmark,
case upper(enrolgrade)
    when 'N' then 'Fail'
    when 'P' then 'Pass'
    when 'C' then 'Credit'
    when 'D' then 'Distinction'
    when 'HD' then 'High Distinction'
end as explained_grade
from uni.enrolment 
join uni.unit using(unitcode)
join uni.student using(stuid)
where upper(stufname) = upper('Claudette')
and upper(stulname) = upper('Serman')
order by year, ofsemester, unitcode;

--2



--3


--4

/* Using outer join */
-- focus table is unit cuz want to show unit
select unitcode, unitname
--,count(prerequnitcode)
from uni.prereq
right join uni.unit using(unitcode)
group by unitcode, unitname
having count(prerequnitcode) = 0
order by unitcode;

select unitcode, unitname,
count(prerequnitcode)
from  uni.unit
left join uni.prereq using(unitcode)
group by unitcode, unitname
order by unitcode;

/* Using set operator MINUS */
select unitcode, unitname
from uni.unit 
MINUS
select unitcode, unitname
from uni.unit join uni.prereq using(unitcode)
order by unitcode;

/* Using subquery */
select unitcode, unitname
from uni.unit
where unitcode NOT IN (
    select unitcode from uni.prereq
)
order by unitcode
;

--5 my ans (????)
select unitcode, ofsemester, count(unitcode) as no_of_enrolment,
nvl(to_char(avg(enrolmark), '90.00'), '0.00') as average_mark
from uni.enrolment
where to_char(ofyear, 'yyyy') = '2019'
group by unitcode, ofsemester
order by average_mark, ofsemester, unitcode
;

--6
select unitcode, unitname, stafffname || ' ' || stafflname as CE_NAME
from uni.offering
join uni.staff using(staffid)
order by unitcode;


--7



--8 italic in ques means string
-- string display on left and num on rigHT
select staffid,
stafffname || ' ' || stafflname as staffname,
'Lecture' as TYPE, --hardcode that column name to Lecture can try out exp outside
count(unitcode) as NO_OF_CLASSES,
sum(clduration) as total_hours,
lpad(to_char(sum(clduration) * 75.6, '$900.00'), 14, ' ') as weekly_payment
from uni.schedclass
join uni.staff using(staffid)
where upper(cltype) = 'L'
and ofsemester = '1' 
and to_char(ofyear, 'yyyy') = '2020'
group by staffid,
stafffname || ' ' || stafflname
order by staffid, type;
union
select staffid,
stafffname || ' ' || stafflname as staffname,
'Tutorial' as TYPE, --hardcode that column name to Lecture can try out exp outside
count(unitcode) as NO_OF_CLASSES,
sum(clduration) as total_hours,
lpad(to_char(sum(clduration) * 42.85, '$900.00'), 14, ' ') as weekly_payment
from uni.schedclass
join uni.staff using(staffid)
where upper(cltype) = 'T'
and ofsemester = '1' 
and to_char(ofyear, 'yyyy') = '2020'
group by staffid,
stafffname || ' ' || stafflname
order by staffid, type;
--9


    
--10








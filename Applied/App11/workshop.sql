SELECT
    drone_id,
    dt_carry_kg,
    drone_cost_hr
FROM
         drone.drone_type
    NATURAL JOIN drone.drone
ORDER BY
    drone_id;

-- pg5
select drone_id,
CASE
    when dt_carry_kg = 0 then 'No loads'
    when dt_carry_kg < 4 then 'Light Loads'
    Else 'Heavy Loads'
    End as carryingcapacity, drone_cost_hr
    from drone.drone natural join drone.DRONE_TYPE
    order by drone_id;

SELECT
    drone_id,
    CASE
        WHEN dt_carry_kg = 0  THEN
            'No load'
        WHEN dt_carry_kg < 4  THEN
            'Light Loads'
        ELSE
            'Heavy Loads'
    END AS carryingcapacity,
    drone_cost_hr
FROM
         drone.drone_type
    NATURAL JOIN drone.drone
ORDER BY
    drone_id;

-- pg8
--find duration for each drone
select drone_id, to_char((rent_in_dt - rent_out_dt), '990.00') as daysout
from drone.rental
where rent_in_dt is not NULL
order by drone_id;
-- find max duration for each drone
select drone_id, MAX(rent_in_dt - rent_out_dt) as daysout
from drone.rental
where rent_in_dt is not NULL
group by drone_id
order by drone_id;
-- find with cust id
SELECT
    distinct drone_id,
    ( rent_in_dt - rent_out_dt ) AS maxdaysout,
    cust_id
FROM
         drone.cust_train
    NATURAL JOIN drone.rental
WHERE
    rent_in_dt IS NOT NULL
    AND ( drone_id, ( rent_in_dt - rent_out_dt ) ) IN (
        SELECT
            drone_id, MAX(rent_in_dt - rent_out_dt)
        FROM
            drone.rental
        WHERE
            rent_in_dt IS NOT NULL
        GROUP BY
            drone_id
    )
ORDER BY
    drone_id,
    cust_id;

-- Subquery (CORRELATED)
SELECT
    distinct drone_id,
    ( rent_in_dt - rent_out_dt ) AS maxdaysout,
    cust_id
FROM
         drone.cust_train
    NATURAL JOIN drone.rental r1
WHERE
    rent_in_dt IS NOT NULL
    AND ( rent_in_dt - rent_out_dt ) = (
        SELECT
            MAX(rent_in_dt - rent_out_dt)
        FROM
            drone.rental r2
        WHERE
            rent_in_dt IS NOT NULL
            AND r1.drone_id = r2.drone_id
    )
ORDER BY
    drone_id,
    cust_id;

--Subquery (INLINE) 
SELECT
    distinct rental.drone_id,
    ( rent_in_dt - rent_out_dt ) AS maxdaysout,
    cust_id
FROM
    (
             (
            SELECT
                drone_id,
                MAX(rent_in_dt - rent_out_dt) AS maxout
            FROM
                drone.rental
            WHERE
                rent_in_dt IS NOT NULL
            GROUP BY
                drone_id
        ) maxtable
        JOIN drone.rental
        ON maxtable.drone_id = rental.drone_id
           AND ( rent_in_dt - rent_out_dt ) = maxtable.maxout
    )
    JOIN drone.cust_train
    USING ( ct_id )
ORDER BY
    drone_id,
    cust_id;

--pg12 must check rent_in_dt not null or else logic error
SELECT
    drone_id,
    COUNT(*) AS times_rented
FROM
    drone.rental
WHERE
    rent_in_dt IS NOT NULL
GROUP BY
    drone_id
ORDER BY
    drone_id;

--Subquery (INLINE)
SELECT
    drone_id,
    COUNT(*) AS times_rented,
    to_char(COUNT(*) * 100 /(
        SELECT
            COUNT(rent_in_dt)
        FROM
            drone.rental
    ), '990.99') AS percent_overall
 FROM
    drone.rental
 WHERE
    rent_in_dt IS NOT NULL
 GROUP BY
    drone_id
 ORDER BY
    percent_overall DESC;

--Use of subquery in INSERT
CREATE TABLE drone_details (
    dd_id        NUMBER(5) NOT NULL,
    dd_pur_date  DATE NOT NULL,
    dd_model     VARCHAR2(50) NOT NULL,
    CONSTRAINT drone_details_pk PRIMARY KEY ( dd_id )
);



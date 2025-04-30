DECLARE
    sid     NUMBER;
    serial# NUMBER;
    CURSOR inactive_sessions IS
    SELECT
        sid,
        serial#
    FROM
        v$session
    WHERE
        type = 'USER'
        AND username = user
        AND upper(osuser) != 'ORACLE'
        AND status = 'INACTIVE';
BEGIN
    OPEN inactive_sessions;
    LOOP
        FETCH inactive_sessions INTO sid, serial#;
        EXIT WHEN inactive_sessions%notfound;
        kill_own_session(sid, serial#);
    END LOOP;

    CLOSE inactive_sessions;
END;
/
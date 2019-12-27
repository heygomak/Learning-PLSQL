SET SERVEROUTPUT ON
DECLARE
	CURSOR dept_cursor (v_deptno NUMBER) IS
		SELECT *
			FROM   dept
			WHERE deptno = v_deptno;
BEGIN
	DBMS_OUTPUT.PUT_LINE ('DEPTNO  DNAME        LOC');
	DBMS_OUTPUT.PUT_LINE ('-----------------------------');
	FOR dept_record IN dept_cursor(10) LOOP
		DBMS_OUTPUT.PUT_LINE (RPAD(dept_record.deptno,8)|| RPAD(dept_record.dname,13)||
		RPAD(dept_record.loc,12));
	END LOOP;
	FOR dept_record IN dept_cursor(20) LOOP
		DBMS_OUTPUT.PUT_LINE (RPAD(dept_record.deptno,8)|| RPAD(dept_record.dname,13)||
		RPAD(dept_record.loc,12));
	END LOOP;
END;
/
SET SERVEROUTPUT OFF
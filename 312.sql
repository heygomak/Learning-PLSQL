SET SERVEROUTPUT ON
DECLARE
	TYPE dept_record_type IS RECORD
		(v_deptno		dept.deptno%TYPE,
		 v_dname		dept.dname%TYPE,
		 v_loc		dept.loc%TYPE);
	dept_record	dept_record_type;
	CURSOR dept_cursor IS
		SELECT     *
			FROM        dept
			ORDER BY deptno;
BEGIN
	OPEN dept_cursor;
	DBMS_OUTPUT.PUT_LINE ('부서번호    이름           급여');
	DBMS_OUTPUT.PUT_LINE ('--------------------------------------');
	LOOP
		FETCH dept_cursor INTO dept_record;
		EXIT WHEN dept_cursor%NOTFOUND;
		DBMS_OUTPUT.PUT_LINE
		   (RPAD(dept_record.v_deptno,10) || RPAD(dept_record.v_dname,15) || RPAD(dept_record.v_loc,12));
	END LOOP;
	CLOSE dept_cursor;
END;
/
SET SERVEROUTPUT OFF
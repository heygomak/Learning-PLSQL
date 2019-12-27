SET SERVEROUTPUT ON
DECLARE
	CURSOR dept_cursor IS
		SELECT *
			FROM dept
			ORDER BY deptno;
BEGIN
	DBMS_OUTPUT.PUT_LINE('�μ���ȣ     �μ���            ��  ġ');
	DBMS_OUTPUT.PUT_LINE('=======================================');
	FOR dept_record IN dept_cursor LOOP
		DBMS_OUTPUT.PUT_LINE(RPAD(dept_record.deptno,10)||
		    RPAD(dept_record.dname,20)||RPAD(dept_record.loc,12));
	END LOOP;
END;
/
SET SERVEROUTPUT OFF
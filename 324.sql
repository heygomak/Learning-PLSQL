SET SERVEROUTPUT ON
DECLARE
	v_cnt		NUMBER;
	CURSOR dept_cursor IS
		SELECT d.deptno, d.dname
			FROM dept d
			WHERE 5 <= (SELECT count(empno)
				    FROM    emp
				    WHERE  deptno = d.deptno);
BEGIN
	DBMS_OUTPUT.PUT_LINE ('DEPTNO    DNAME          NUM');
	DBMS_OUTPUT.PUT_LINE ('=============================');
	FOR dept_record IN dept_cursor LOOP
		SELECT count(empno)
			INTO v_cnt
			FROM emp
			WHERE deptno = dept_record.deptno;
		DBMS_OUTPUT.PUT_LINE 
                                 (RPAD(dept_record.deptno,10)||LPAD(dept_record.dname,13) || LPAD(v_cnt,5));
	END LOOP;
END;
/
SET SERVEROUTPUT OFF
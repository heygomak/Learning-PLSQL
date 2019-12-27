SET VERIFY OFF
SET SERVEROUTPUT ON
ACCEPT	 p_deptno	 PROMPT	 'Input your deptno : '
ACCEPT	 p_job		 PROMPT	 'Input your job : '
DECLARE
	v_sal_total	NUMBER(10, 2) := 0;
	CURSOR emp_cursor (v_deptno	emp.deptno%TYPE,
                     v_job		 VARCHAR2) IS
		SELECT empno, ename, sal
			FROM		emp
			WHERE		deptno = v_deptno and job = v_job
			ORDER BY	empno;
BEGIN
	DBMS_OUTPUT.PUT_LINE ('EMPNO   ENAME   SAL');
	DBMS_OUTPUT.PUT_LINE ('----------------------------------------');
	FOR emp_record IN emp_cursor(&p_deptno, UPPER('&p_job')) LOOP
		v_sal_total := v_sal_total + emp_record.sal;
		DBMS_OUTPUT.PUT_LINE (RPAD(emp_record.empno,6) || RPAD(emp_record.ename,12)||
			LPAD(TO_CHAR(emp_record.sal,'$99,999,990.00'),16));
	END LOOP;
	DBMS_OUTPUT.PUT_LINE ('----------------------------------------');
	DBMS_OUTPUT.PUT_LINE (RPAD(TO_CHAR(&p_deptno),2)||' DEPTs SAL of TOTAL '||
		LPAD(TO_CHAR(v_sal_total, '$99,999,990.00'),16));
END;
/
SET VERIFY ON
SET SERVEROUTPUT OFF
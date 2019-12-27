SET VERIFY OFF
SET SERVEROUTPUT ON
ACCEPT p_deptno PROMPT '부서 번호를 입력하세요 : '
ACCEPT p_job PROMPT '담당 업무를 입력하세요 : '
DECLARE
	TYPE emp_record_type IS RECORD (
		v_empno		emp.empno%TYPE,
		v_ename		emp.ename%TYPE,
		v_sal		emp.sal%TYPE);
	emp_record	emp_record_type;	
	v_sal_total	NUMBER(10, 2) := 0;
	CURSOR emp_cursor (v_deptno  emp.deptno%TYPE,
                     v_job     VARCHAR2) IS
		SELECT empno, ename, sal
			FROM         emp
			WHERE       deptno = v_deptno AND job = v_job
			ORDER BY  empno;
BEGIN
	DBMS_OUTPUT.PUT_LINE ('EMPNO      ENAME        SAL');
	DBMS_OUTPUT.PUT_LINE ('---------------------------------');
	OPEN emp_cursor (&p_deptno, UPPER('&p_job'));
	LOOP
		FETCH emp_cursor INTO emp_record;
		EXIT WHEN emp_cursor%NOTFOUND;
		v_sal_total := v_sal_total + emp_record.v_sal;
		DBMS_OUTPUT.PUT_LINE (RPAD(emp_record.v_empno,9)||RPAD(emp_record.v_ename,9)||
			RPAD(TO_CHAR(emp_record.v_sal,'$99,999,990.00'),16));
	END LOOP;
	DBMS_OUTPUT.PUT_LINE ('---------------------------------');
	DBMS_OUTPUT.PUT_LINE (RPAD(TO_CHAR(&p_deptno),2)||'번 부서의 합   '||
		LPAD(TO_CHAR(v_sal_total, '$99,999,990.00'),16));
	CLOSE emp_cursor;
END;
/
SET VERIFY ON
SET SERVEROUTPUT OFF
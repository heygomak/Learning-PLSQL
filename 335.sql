SET VERIFY OFF
SET SERVEROUTPUT ON
ACCEPT p_deptno PROMPT '조회하고자 하는 부서 번호를 입력하시오. : '
DECLARE
	v_deptno			emp.deptno%TYPE := &p_deptno;
	CURSOR emp_cursor IS
		SELECT empno, ename, job, sal
			FROM  emp
			WHERE deptno = v_deptno;
	emp_deptno_ck		EXCEPTION;
BEGIN
	IF v_deptno NOT IN (10,20,30) THEN
		RAISE emp_deptno_ck;
	ELSE
		DBMS_OUTPUT.PUT_LINE('사번   이   름    담당업무        급  여');
		DBMS_OUTPUT.PUT_LINE('-----------------------------------------');
		FOR emp_record IN emp_cursor LOOP
		   DBMS_OUTPUT.PUT_LINE(RPAD(emp_record.empno,4)||'   '||
		      RPAD(emp_record.ename,11)||RPAD(emp_record.job,10)||
		      RPAD(TO_CHAR(emp_record.sal,'$999,999.00'),12));
		END LOOP;
	END IF;
EXCEPTION
	WHEN emp_deptno_ck THEN
		DBMS_OUTPUT.PUT_LINE(v_deptno||'번 부서는 자료가 없습니다.');
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('기타 에러입니다.');
END;
/
SET VERIFY ON
SET SERVEROUTPUT OFF
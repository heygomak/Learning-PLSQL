SET VERIFY OFF
SET SERVEROUTPUT ON
ACCEPT p_ename PROMPT '이름을 입력하시오 : '
DECLARE
	TYPE	emp_record_type IS RECORD (
		v_empno		emp.empno%TYPE,
		v_ename		emp.ename%TYPE,
		v_sal			emp.sal%TYPE,
		v_deptno		emp.deptno%TYPE);
	emp_record		emp_record_type;
	g_ename		emp.ename%TYPE := UPPER('&p_ename');
BEGIN
	SELECT empno, ename, sal, deptno
		INTO	emp_record
		FROM     emp
		WHERE  ename = g_ename;
	IF emp_record.v_deptno = 10 THEN
		UPDATE emp
			SET    sal = TRUNC(emp_record.v_sal * 1.25, -1)
			WHERE empno = emp_record.v_empno;
	ELSIF emp_record.v_deptno = 20 THEN
		UPDATE emp
			SET    sal = TRUNC(emp_record.v_sal * 1.20, -1) 
			WHERE empno = emp_record.v_empno;
	ELSIF emp_record.v_deptno = 30 THEN
		UPDATE emp
			SET    sal = TRUNC(emp_record.v_sal * 1.15, -1) 
			WHERE empno = emp_record.v_empno;
	END IF;
EXCEPTION
		WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE('&p_ename' || '는 자료가 없습니다.');
		WHEN TOO_MANY_ROWS THEN
			DBMS_OUTPUT.PUT_LINE('&p_ename' || '는 자료가 여러개 있습니다.');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('기타 에러입니다.');
END;
/
SET VERIFY ON
SET SERVEROUTPUT OFF
SET VERIFY OFF
SET SERVEROUTPUT ON
ACCEPT p_ename PROMPT '삭제하고자 하는 사원의 이름을 입력하시오. : '
DECLARE
	v_ename			emp.ename%TYPE := '&p_ename';
	v_empno			emp.empno%TYPE;
	emp_constraint		EXCEPTION;
  -- 오라클에서 발생하는 에러를 알고있는 경우에 예외를 선언하는 것
	PRAGMA EXCEPTION_INIT (emp_constraint, -2292);
BEGIN
	SELECT empno
		INTO  v_empno
		FROM  emp
		WHERE ename = UPPER(v_ename);
	DELETE emp
		WHERE empno = v_empno;
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE(v_ename || '는 자료가 없습니다.');
	WHEN TOO_MANY_ROWS THEN
		DBMS_OUTPUT.PUT_LINE(v_ename || '는 동명 이인입니다.');
	WHEN emp_constraint THEN
		DBMS_OUTPUT.PUT_LINE(v_ename || '는 삭제할 수 없습니다.');
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('기타 에러입니다.');
END;
/
SET VERIFY ON
SET SERVEROUTPUT OFF
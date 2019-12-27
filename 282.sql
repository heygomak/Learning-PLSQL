SET VERIFY OFF
SET SERVEROUTPUT ON
ACCEPT p_name PROMPT '사원의 이름을 입력하시요 : '
DECLARE
	v_name		emp.ename%TYPE := UPPER('&p_name');
	v_sal			emp.sal%TYPE;
	v_hiredate		emp.hiredate%TYPE;
BEGIN
	SELECT sal, hiredate
		INTO  v_sal, v_hiredate
		FROM  emp
		WHERE ename = v_name;
	DBMS_OUTPUT.PUT_LINE
	   ('급  여 : '|| LTRIM(TO_CHAR(v_sal,'$999,999')));
	DBMS_OUTPUT.PUT_LINE
	   ('입사일 : '|| TO_CHAR(v_hiredate,'YYYY-MM-DD'));
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE(v_name||'는 자료가 없습니다.');
	WHEN TOO_MANY_ROWS THEN
		DBMS_OUTPUT.PUT_LINE(v_name||'은 동명이인 입니다.');
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('기타 에러입니다.');
END;
/
SET VERIFY ON
SET SERVEROUTPUT OFF
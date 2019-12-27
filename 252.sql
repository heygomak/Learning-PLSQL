SET VERIFY OFF
SET SERVEROUTPUT ON
ACCEPT p_name PROMPT '이 름 : '
DECLARE
	v_empno		emp.empno%TYPE;
	v_name		emp.ename%TYPE := UPPER('&p_name');
	v_sal			emp.sal%TYPE;
	v_job		emp.job%TYPE;
BEGIN
	SELECT empno, job, sal
		INTO  v_empno, v_job, v_sal
		FROM  emp
		WHERE ename = v_name;
	IF v_job IN ('MANAGER','ANALYST') THEN
		v_sal := v_sal * 1.5;
	ELSE
		v_sal := v_sal * 1.2;
	END IF;
	UPDATE emp
		SET   sal = v_sal
		WHERE empno = v_empno;
	IF SQL%FOUND THEN
		DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT||'개의 행이 갱신되었습니다.');
	ELSE
		DBMS_OUTPUT.PUT_LINE('갱신된 자료가 없습니다.');
	END IF;
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE(v_name || '는 자료가 없습니다.');
	WHEN TOO_MANY_ROWS THEN
		DBMS_OUTPUT.PUT_LINE(v_name || '는 동명 이인입니다.');
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('기타 에러가 발생했습니다.');
END;
/
SET VERIFY ON
SET SERVEROUTPUT OFF
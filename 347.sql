CREATE OR REPLACE FUNCTION ename_deptno (
	v_ename	IN	emp.ename%TYPE)
RETURN NUMBER
IS
	v_deptno 	emp.deptno%TYPE;
BEGIN
	SELECT deptno
		INTO    v_deptno
		FROM  emp
		WHERE ename = UPPER(v_ename);
	DBMS_OUTPUT.PUT_LINE ('부서번호 : '|| TO_CHAR(v_deptno));
	RETURN v_deptno;
EXCEPTION
		WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE ('입력한 MANAGER는 없습니다.');
		WHEN TOO_MANY_ROWS THEN
			DBMS_OUTPUT.PUT_LINE ('자료가 2건 이상입니다.');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE ('기타 에러입니다.');
END;
/
CREATE OR REPLACE PROCEDURE dname_sal_disp (
	v_ename	IN		emp.ename%TYPE,
	v_dname	OUT	dept.dname%TYPE,
	v_sal		OUT	emp.sal%TYPE)
IS
	v_deptno   emp.deptno%TYPE;
BEGIN
	SELECT sal, deptno
		INTO  v_sal, v_deptno
		FROM  emp
		WHERE ename = UPPER(v_ename);
	SELECT dname
		INTO  v_dname
		FROM  dept
		WHERE deptno = v_deptno;
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE ('입력한 MANAGER는 없습니다.');
	WHEN TOO_MANY_ROWS THEN
		DBMS_OUTPUT.PUT_LINE ('자료가 2건 이상 입니다.');
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE ('기타 에러 입니다.');
END;
/
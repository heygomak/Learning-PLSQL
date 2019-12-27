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
	DBMS_OUTPUT.PUT_LINE ('�μ���ȣ : '|| TO_CHAR(v_deptno));
	RETURN v_deptno;
EXCEPTION
		WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE ('�Է��� MANAGER�� �����ϴ�.');
		WHEN TOO_MANY_ROWS THEN
			DBMS_OUTPUT.PUT_LINE ('�ڷᰡ 2�� �̻��Դϴ�.');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE ('��Ÿ �����Դϴ�.');
END;
/
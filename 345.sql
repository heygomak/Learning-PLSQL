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
		DBMS_OUTPUT.PUT_LINE ('�Է��� MANAGER�� �����ϴ�.');
	WHEN TOO_MANY_ROWS THEN
		DBMS_OUTPUT.PUT_LINE ('�ڷᰡ 2�� �̻� �Դϴ�.');
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE ('��Ÿ ���� �Դϴ�.');
END;
/
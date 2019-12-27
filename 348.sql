CREATE OR REPLACE FUNCTION emp_disp (
	v_ename	IN		emp.ename%TYPE,
	v_dname	OUT	dept.dname%TYPE,
	v_sal		OUT	emp.sal%TYPE)
RETURN NUMBER
IS
	v_deptno		emp.deptno%TYPE;
	v_dname_temp	dept.dname%TYPE;
	v_sal_temp		emp.sal%TYPE;
BEGIN
	SELECT sal, deptno
		INTO  v_sal_temp, v_deptno
		FROM  emp
		WHERE ename = UPPER(v_ename);
	SELECT dname
		INTO  v_dname_temp
		FROM  dept
		WHERE deptno = v_deptno;
	v_dname := v_dname_temp;
	v_sal := v_sal_temp;
	DBMS_OUTPUT.PUT_LINE('��        �� : '||v_ename);
	DBMS_OUTPUT.PUT_LINE('�μ���ȣ : '||TO_CHAR(v_deptno));
	DBMS_OUTPUT.PUT_LINE('��  ��  �� : '||v_dname_temp);
	DBMS_OUTPUT.PUT_LINE('��        �� : '||TO_CHAR(v_sal_temp,'$999,999'));
	RETURN v_deptno;
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('�Է��� MANAGER�� �����ϴ�.');
	WHEN TOO_MANY_ROWS THEN
		DBMS_OUTPUT.PUT_LINE('�ڷᰡ 2�� �̻��Դϴ�.');
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('��Ÿ �����Դϴ�.');
END;
/
CREATE OR REPLACE PROCEDURE emp_input (
	v_name		IN	emp.ename%TYPE,
	v_job		IN	emp.job%TYPE,
	v_mgr		IN	emp.mgr%TYPE,
	v_sal		IN	emp.sal%TYPE)
IS
	v_comm			emp.comm%TYPE;
	v_deptno		emp.deptno%TYPE;
	manager_error	EXCEPTION;
BEGIN
	IF UPPER(v_job) NOT IN ('PRESIDENT','MANAGER','ANALYST','SALESMAN','CLERK') THEN
		RAISE manager_error;
	ELSIF UPPER(v_job) = 'SALESMAN' THEN
		v_comm := 0;
	ELSE
		v_comm := NULL;
	END IF;
	SELECT deptno
		INTO  v_deptno
		FROM  emp
		WHERE empno = v_mgr;
	INSERT INTO emp
		VALUES (empno_seq.NEXTVAL, v_name, UPPER(v_job), v_mgr, SYSDATE, v_sal, v_comm, v_deptno);
EXCEPTION
	WHEN manager_error THEN
		DBMS_OUTPUT.PUT_LINE('��� ������ �߸� �ԷµǾ����ϴ�.');
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('�Է��� MANAGER�� �����ϴ�.');
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('��Ÿ �����Դϴ�.');
END;
/
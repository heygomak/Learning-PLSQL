SET VERIFY OFF
SET SERVEROUTPUT ON
ACCEPT p_ename PROMPT '�����ϰ��� �ϴ� ����� �̸��� �Է��Ͻÿ�. : '
DECLARE
	v_ename			emp.ename%TYPE := '&p_ename';
	v_empno			emp.empno%TYPE;
	emp_constraint		EXCEPTION;
  -- ����Ŭ���� �߻��ϴ� ������ �˰��ִ� ��쿡 ���ܸ� �����ϴ� ��
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
		DBMS_OUTPUT.PUT_LINE(v_ename || '�� �ڷᰡ �����ϴ�.');
	WHEN TOO_MANY_ROWS THEN
		DBMS_OUTPUT.PUT_LINE(v_ename || '�� ���� �����Դϴ�.');
	WHEN emp_constraint THEN
		DBMS_OUTPUT.PUT_LINE(v_ename || '�� ������ �� �����ϴ�.');
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('��Ÿ �����Դϴ�.');
END;
/
SET VERIFY ON
SET SERVEROUTPUT OFF
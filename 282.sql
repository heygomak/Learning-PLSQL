SET VERIFY OFF
SET SERVEROUTPUT ON
ACCEPT p_name PROMPT '����� �̸��� �Է��Ͻÿ� : '
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
	   ('��  �� : '|| LTRIM(TO_CHAR(v_sal,'$999,999')));
	DBMS_OUTPUT.PUT_LINE
	   ('�Ի��� : '|| TO_CHAR(v_hiredate,'YYYY-MM-DD'));
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE(v_name||'�� �ڷᰡ �����ϴ�.');
	WHEN TOO_MANY_ROWS THEN
		DBMS_OUTPUT.PUT_LINE(v_name||'�� �������� �Դϴ�.');
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('��Ÿ �����Դϴ�.');
END;
/
SET VERIFY ON
SET SERVEROUTPUT OFF
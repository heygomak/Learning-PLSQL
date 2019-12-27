SET VERIFY OFF
SET SERVEROUTPUT ON
ACCEPT p_ename PROMPT '��ȸ�ϰ��� �ϴ� ����� �̸��� �Է��Ͻÿ� : '
DECLARE
	emp_record	emp%ROWTYPE;
	v_ename		emp.ename%TYPE := UPPER('&p_ename');
BEGIN
	SELECT *
		INTO   emp_record
		FROM   emp
		WHERE ename = v_ename;
	DBMS_OUTPUT.PUT_LINE
	('��� ��ȣ  : '||TO_CHAR(emp_record.empno));
	DBMS_OUTPUT.PUT_LINE
	('��      �� : '||emp_record.ename);
	DBMS_OUTPUT.PUT_LINE
	('��      �� : '||emp_record.job);
	DBMS_OUTPUT.PUT_LINE
	('��  ��  �� : '||TO_CHAR(emp_record.mgr));
	DBMS_OUTPUT.PUT_LINE
	('�Ի�����   : '||TO_CHAR(emp_record.hiredate,'YYYY-MM-DD'));
	DBMS_OUTPUT.PUT_LINE
	('��      �� : '||LTRIM(TO_CHAR(emp_record.sal,'$999,999.00')));
	DBMS_OUTPUT.PUT_LINE
	('��  ��  �� : '||LTRIM(TO_CHAR(NVL(emp_record.comm,0),'$999,990')));
	DBMS_OUTPUT.PUT_LINE
	('�μ� ��ȣ  : '||TO_CHAR(emp_record.deptno));
EXCEPTION
		WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE('&p_ename'||'�� �ڷ�� �����ϴ�.');
		WHEN TOO_MANY_ROWS THEN
			DBMS_OUTPUT.PUT_LINE('&p_ename'||'�ڷᰡ 2�� �̻��Դϴ�.');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('��Ÿ ���� �Դϴ�');
END;
/
SET VERIFY ON
SET SERVEROUTPUT OFF
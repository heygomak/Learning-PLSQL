SET VERIFY OFF
SET SERVEROUTPUT ON
ACCEPT p_ename PROMPT '��ȸ�ϰ��� �ϴ� ����� �̸��� �Է��Ͻÿ� : '
DECLARE
	TYPE emp_record_type IS RECORD (
		v_empno		emp.empno%TYPE,
		v_ename		emp.ename%TYPE,
		v_job		emp.job%TYPE,
		v_mgr		emp.mgr%TYPE);
    emp_record		emp_record_type;
    v_ename			emp.ename%TYPE  := UPPER('&p_ename');
BEGIN
	SELECT empno, ename, job, mgr
		INTO    emp_record
		FROM   emp
		WHERE ename = v_ename;
	DBMS_OUTPUT.PUT_LINE
	('�����ȣ : '||to_char(emp_record.v_empno));
	DBMS_OUTPUT.PUT_LINE
	('��    �� : '||emp_record.v_ename);
	DBMS_OUTPUT.PUT_LINE
	('��    �� : '||emp_record.v_job);
	DBMS_OUTPUT.PUT_LINE
	('�� �� �� : '||to_char(emp_record.v_mgr));
END;
/
SET VERIFY ON
SET SERVEROUTPUT OFF
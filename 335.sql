SET VERIFY OFF
SET SERVEROUTPUT ON
ACCEPT p_deptno PROMPT '��ȸ�ϰ��� �ϴ� �μ� ��ȣ�� �Է��Ͻÿ�. : '
DECLARE
	v_deptno			emp.deptno%TYPE := &p_deptno;
	CURSOR emp_cursor IS
		SELECT empno, ename, job, sal
			FROM  emp
			WHERE deptno = v_deptno;
	emp_deptno_ck		EXCEPTION;
BEGIN
	IF v_deptno NOT IN (10,20,30) THEN
		RAISE emp_deptno_ck;
	ELSE
		DBMS_OUTPUT.PUT_LINE('���   ��   ��    ������        ��  ��');
		DBMS_OUTPUT.PUT_LINE('-----------------------------------------');
		FOR emp_record IN emp_cursor LOOP
		   DBMS_OUTPUT.PUT_LINE(RPAD(emp_record.empno,4)||'   '||
		      RPAD(emp_record.ename,11)||RPAD(emp_record.job,10)||
		      RPAD(TO_CHAR(emp_record.sal,'$999,999.00'),12));
		END LOOP;
	END IF;
EXCEPTION
	WHEN emp_deptno_ck THEN
		DBMS_OUTPUT.PUT_LINE(v_deptno||'�� �μ��� �ڷᰡ �����ϴ�.');
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('��Ÿ �����Դϴ�.');
END;
/
SET VERIFY ON
SET SERVEROUTPUT OFF
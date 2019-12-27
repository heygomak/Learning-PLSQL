SET VERIFY OFF
SET SERVEROUTPUT ON
ACCEPT p_deptno PROMPT '�μ���ȣ�� �Է��ϼ��� : '
DECLARE
	v_sal_total	NUMBER;
BEGIN
	SELECT SUM(sal)
 		INTO v_sal_total
		FROM emp
		WHERE deptno = &p_deptno;
	IF v_sal_total IS NULL THEN
		DBMS_OUTPUT.PUT_LINE(&p_deptno||'�� �μ��� �ش��ڰ� �����ϴ�.');
	ELSE
		DBMS_OUTPUT.PUT_LINE
			(&p_deptno||'�� �μ��� �޿��� �� : '||
				 LTRIM(TO_CHAR(v_sal_total, '$99,999,000')));
	END IF;
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE (&p_deptno||'�� �ڷᰡ �����ϴ�.');
	WHEN TOO_MANY_ROWS THEN
		DBMS_OUTPUT.PUT_LINE (&p_deptno||'�� �μ��� �ߺ��Դϴ�.');
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE ('��Ÿ �����Դϴ�.');
END;
/
SET VERIFY ON
SET SERVEROUTPUT OFF
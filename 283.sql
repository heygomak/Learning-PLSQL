SET VERIFY OFF
SET SERVEROUTPUT ON
ACCEPT p_deptno PROMPT '�μ���ȣ�� �Է��ϼ���(�޿��� ���� ����) : '
DECLARE
	v_sal_total	NUMBER;
BEGIN
	SELECT SUM(sal)
 		INTO v_sal_total
		FROM emp
		WHERE deptno = &p_deptno;
	DBMS_OUTPUT.PUT_LINE
      (&p_deptno||'�� �μ��� �޿��� �� : '||
			LTRIM(TO_CHAR(v_sal_total, '$99,999,000')));
    -- LTRIM : ���ڿ��� ���� ������ �����ϴ� ��
    -- RTRIM : ���ڿ��� ���� ������ �����ϴ� ��
END;
/
SET VERIFY ON
SET SERVEROUTPUT OFF
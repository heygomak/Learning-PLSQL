SET VERIFY OFF
SET SERVEROUTPUT ON
ACCEPT p_deptno PROMPT '�μ���ȣ�� �Է��Ͻÿ� : '
DECLARE
	v_deptno		emp.deptno%TYPE := &p_deptno;
	v_empno		emp.empno%TYPE;
	v_ename		emp.ename%TYPE;
	v_sal			emp.sal%TYPE;
	v_sal_total		NUMBER(10,2) := 0;
	CURSOR emp_cursor IS
		SELECT     empno, ename, sal
			FROM		 emp
			WHERE		 deptno = v_deptno
			ORDER BY	 empno;
BEGIN
	OPEN emp_cursor;
  -- OPEN CURSOR : �޸� ������ �Ҵ� ����
	DBMS_OUTPUT.PUT_LINE ('���    �̸�         �޿�');
	DBMS_OUTPUT.PUT_LINE ('---------------------------');
	LOOP
  -- FETCH ~ INTO : Ŀ�� �ȿ� �ִ� �����͸� select �ϰڴ�.
		FETCH emp_cursor INTO v_empno, v_ename, v_sal;
		EXIT WHEN emp_cursor%NOTFOUND;
    -- EXIT WHEN : ���ǹ��� true�϶� brak ��Ų��
    -- ���⼭��, FETCH�� ���� ���� �� ����
    -- PL/SQL������ �ѹ��� �� �ุ ������ �� �ֱ� ������ ���� ���� ó���� �ʿ��� ��쿡�� loop���� ����Ѵ�.
			v_sal_total := v_sal_total + v_sal;
		DBMS_OUTPUT.PUT_LINE
		   (RPAD(v_empno,8)||RPAD(v_ename,8)||LPAD(TO_CHAR(v_sal, '$999,990.00'),12));
	END LOOP;
	DBMS_OUTPUT.PUT_LINE ('===========================');
	DBMS_OUTPUT.PUT_LINE (RTRIM(TO_CHAR(v_deptno))||'�� �μ��� �� '||
		RPAD(TO_CHAR(v_sal_total,'$999,990.00'),13));
    -- �۾��� ���� �Ŀ� �Ҵ���� �޸� ������ �����Ѵ�.
	CLOSE emp_cursor;
END;
/
SET VERIFY ON
SET SERVEROUTPUT OFF
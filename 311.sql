SET SERVEROUTPUT ON
DECLARE
	dept_record	dept%ROWTYPE;
  -- ���̺��� ������ �״�� �����ͼ� ����ϰڴ�!
	CURSOR dept_cursor IS
		SELECT     *
			FROM        dept
			ORDER BY deptno;
BEGIN
	OPEN dept_cursor;
	DBMS_OUTPUT.PUT_LINE ('�μ�    �μ��̸�      ��ġ');
	DBMS_OUTPUT.PUT_LINE ('----------------------------');
	LOOP
		FETCH dept_cursor INTO dept_record;
		EXIT WHEN dept_cursor%NOTFOUND;
		DBMS_OUTPUT.PUT_LINE
		   (RPAD(dept_record.deptno,8)||RPAD(dept_record.dname,13)
		   ||LPAD(dept_record.loc,11));
	END LOOP;
	CLOSE dept_cursor;
END;
/
SET VERIFY ON
SET SERVEROUTPUT OFF
SET SERVEROUTPUT ON
DECLARE
BEGIN
-- �Ͻ����� CURSOR : open fetch close
	DBMS_OUTPUT.PUT_LINE('�μ���ȣ    �μ���         ��  ġ');
	DBMS_OUTPUT.PUT_LINE('------------------------------------');
	FOR dept_record IN (SELECT * FROM dept order by deptno) LOOP
		DBMS_OUTPUT.PUT_LINE(RPAD(dept_record.deptno,5) ||'     '
		   || RPAD(dept_record.dname,15) || RPAD(dept_record.loc,12));
	END LOOP;
END;
/
SET SERVEROUTPUT OFF
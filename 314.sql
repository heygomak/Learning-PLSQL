SET SERVEROUTPUT ON
DECLARE
BEGIN
-- 암시적인 CURSOR : open fetch close
	DBMS_OUTPUT.PUT_LINE('부서번호    부서명         위  치');
	DBMS_OUTPUT.PUT_LINE('------------------------------------');
	FOR dept_record IN (SELECT * FROM dept order by deptno) LOOP
		DBMS_OUTPUT.PUT_LINE(RPAD(dept_record.deptno,5) ||'     '
		   || RPAD(dept_record.dname,15) || RPAD(dept_record.loc,12));
	END LOOP;
END;
/
SET SERVEROUTPUT OFF
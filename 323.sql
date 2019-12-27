DECLARE
	CURSOR emp_cursor IS
		SELECT sal, deptno
			FROM emp
			ORDER BY deptno
			FOR UPDATE OF sal, deptno;
BEGIN
	FOR emp_record IN emp_cursor LOOP
		IF emp_record.deptno = 10 THEN
			UPDATE emp
			SET sal = TRUNC(emp_record.sal * 1.25,-1), deptno = 20
				WHERE CURRENT OF emp_cursor;
		ELSIF emp_record.deptno = 20 THEN
			UPDATE emp
			SET sal = TRUNC(emp_record.sal * 1.15,-1), deptno = 30
				WHERE CURRENT OF emp_cursor;
		ELSIF emp_record.deptno = 30 THEN
			UPDATE emp
			SET sal = TRUNC(emp_record.sal * 1.20,-1), deptno = 10
				WHERE CURRENT OF emp_cursor;
		END IF;
	END LOOP;
END;
/
SET VERIFY OFF
SET SERVEROUTPUT ON
ACCEPT p_name PROMPT '����� �̸��� �Է��Ͻÿ� : '
--CREATE SEQUENCE empno_sq
--INCREMENT BY 1
--START WITH 1000
--NOCYCLE NOCACHE;

DECLARE
	v_empno		emp.empno%TYPE;
  
BEGIN
	SELECT empno_seq.NEXTVAL
		INTO  v_empno
		FROM dual;
	INSERT INTO emp (empno, ename, job, deptno)
	VALUES (v_empno, 'ALVIN','MANAGER',10);
  COMMIT;
END;
/
SET VERIFY ON
SET SERVEROUTPUT OFF
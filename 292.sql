SET VERIFY OFF
ACCEPT	p_name		PROMPT	'이 름 : '
ACCEPT	p_sal			PROMPT	'급 여 : '
ACCEPT	p_deptno		PROMPT	'부서번호 : '
DECLARE
	v_name		VARCHAR2(10) := UPPER('&p_name');
	v_sal			NUMBER(7,2)	:= &p_sal;
	v_deptno	NUMBER(2)	:= &p_deptno;
BEGIN
	IF v_deptno = 10 THEN
		v_sal := v_sal * 1.2;
        END IF;
	INSERT INTO emp (empno, ename, sal, deptno)
		VALUES (empno_sequence.NEXTVAL, v_name, v_sal, v_deptno);
	COMMIT;
END;
/
SET VERIFY ON

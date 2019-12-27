SET VERIFY OFF

ACCEPT p_name	PROMPT	'�� �� : '
ACCEPT p_sal		PROMPT	'�� �� : '
ACCEPT p_deptno	PROMPT	'�μ���ȣ : '

DECLARE
	v_name		VARCHAR2(10) := UPPER('&P_NAME');
	v_sal			NUMBER(7,2)  := &p_sal;
	V_deptno		NUMBER(2)    := &p_deptno;
  
BEGIN
	IF v_deptno = 10 THEN
		v_sal := v_sal * 1.2;
        ELSIF v_deptno = 30 THEN
         	v_sal := v_sal * 1.1;
	END IF;
	INSERT INTO emp (empno, ename, sal, deptno)
		VALUES (empno_sequence.NEXTVAL, v_name, v_sal, v_deptno);
	COMMIT;
END;

SET VERIFY ON

SET VERIFY OFF
SET SERVEROUTPUT ON
ACCEPT p_ename PROMPT '조회하고자 하는 사원의 이름을 입력하시오 : '
DECLARE
	TYPE emp_record_type IS RECORD (
		v_empno		emp.empno%TYPE,
		v_ename		emp.ename%TYPE,
		v_job		emp.job%TYPE,
		v_mgr		emp.mgr%TYPE);
    emp_record		emp_record_type;
    v_ename			emp.ename%TYPE  := UPPER('&p_ename');
BEGIN
	SELECT empno, ename, job, mgr
		INTO    emp_record
		FROM   emp
		WHERE ename = v_ename;
	DBMS_OUTPUT.PUT_LINE
	('사원번호 : '||to_char(emp_record.v_empno));
	DBMS_OUTPUT.PUT_LINE
	('이    름 : '||emp_record.v_ename);
	DBMS_OUTPUT.PUT_LINE
	('업    무 : '||emp_record.v_job);
	DBMS_OUTPUT.PUT_LINE
	('매 니 저 : '||to_char(emp_record.v_mgr));
END;
/
SET VERIFY ON
SET SERVEROUTPUT OFF
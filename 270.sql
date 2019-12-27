SET VERIFY OFF
SET SERVEROUTPUT ON
ACCEPT p_ename PROMPT '조회하고자 하는 사원의 이름을 입력하시오 : '
DECLARE
	emp_record	emp%ROWTYPE;
	v_ename		emp.ename%TYPE := UPPER('&p_ename');
BEGIN
	SELECT *
		INTO   emp_record
		FROM   emp
		WHERE ename = v_ename;
	DBMS_OUTPUT.PUT_LINE
	('사원 번호  : '||TO_CHAR(emp_record.empno));
	DBMS_OUTPUT.PUT_LINE
	('이      름 : '||emp_record.ename);
	DBMS_OUTPUT.PUT_LINE
	('업      무 : '||emp_record.job);
	DBMS_OUTPUT.PUT_LINE
	('매  니  저 : '||TO_CHAR(emp_record.mgr));
	DBMS_OUTPUT.PUT_LINE
	('입사일자   : '||TO_CHAR(emp_record.hiredate,'YYYY-MM-DD'));
	DBMS_OUTPUT.PUT_LINE
	('급      여 : '||LTRIM(TO_CHAR(emp_record.sal,'$999,999.00')));
	DBMS_OUTPUT.PUT_LINE
	('보  너  스 : '||LTRIM(TO_CHAR(NVL(emp_record.comm,0),'$999,990')));
	DBMS_OUTPUT.PUT_LINE
	('부서 번호  : '||TO_CHAR(emp_record.deptno));
EXCEPTION
		WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE('&p_ename'||'의 자료는 없습니다.');
		WHEN TOO_MANY_ROWS THEN
			DBMS_OUTPUT.PUT_LINE('&p_ename'||'자료가 2건 이상입니다.');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('기타 에러 입니다');
END;
/
SET VERIFY ON
SET SERVEROUTPUT OFF
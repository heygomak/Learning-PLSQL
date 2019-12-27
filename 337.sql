SET VERIFY OFF
SET SERVEROUTPUT ON
ACCEPT p_ename PROMPT '삭제하고자 하는 사원의 이름을 입력하시오. : '
DECLARE
	v_ename		emp.ename%TYPE := '&p_ename';
	v_err_code		NUMBER;
	v_err_msg		VARCHAR2(255);
BEGIN
	DELETE emp
		WHERE ename = v_ename;
	IF SQL%NOTFOUND THEN
		RAISE_APPLICATION_ERROR(-20100, 'No data found');
	END IF;
EXCEPTION
	WHEN OTHERS THEN
		ROLLBACK;
		v_err_code := SQLCODE;
		v_err_msg  := SQLERRM;
		DBMS_OUTPUT.PUT_LINE('에러번호 : '||TO_CHAR(v_err_code));
		DBMS_OUTPUT.PUT_LINE('에러내용 : '||v_err_msg);
END;
/
SET VERIFY ON
SET SERVEROUTPUT OFF
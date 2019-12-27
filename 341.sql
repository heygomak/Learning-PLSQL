CREATE OR REPLACE PROCEDURE emp_sal_update (
	p_empno	IN	emp.empno%TYPE,
	p_sal		IN	emp.sal%TYPE)
IS
BEGIN
	UPDATE emp
		SET      sal = p_sal
		WHERE empno = p_empno;
	IF SQL%NOTFOUND THEN
		DBMS_OUTPUT.PUT_LINE
		   (TO_CHAR(p_empno) ||'는 없는 사원번호입니다.');
	ELSE
		DBMS_OUTPUT.PUT_LINE
		   (TO_CHAR(SQL%ROWCOUNT) || '명의 자료를 수정하였습니다.');
	END IF;
END emp_sal_update;
/
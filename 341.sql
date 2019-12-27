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
		   (TO_CHAR(p_empno) ||'�� ���� �����ȣ�Դϴ�.');
	ELSE
		DBMS_OUTPUT.PUT_LINE
		   (TO_CHAR(SQL%ROWCOUNT) || '���� �ڷḦ �����Ͽ����ϴ�.');
	END IF;
END emp_sal_update;
/
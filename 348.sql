CREATE OR REPLACE FUNCTION emp_disp (
	v_ename	IN		emp.ename%TYPE,
	v_dname	OUT	dept.dname%TYPE,
	v_sal		OUT	emp.sal%TYPE)
RETURN NUMBER
IS
	v_deptno		emp.deptno%TYPE;
	v_dname_temp	dept.dname%TYPE;
	v_sal_temp		emp.sal%TYPE;
BEGIN
	SELECT sal, deptno
		INTO  v_sal_temp, v_deptno
		FROM  emp
		WHERE ename = UPPER(v_ename);
	SELECT dname
		INTO  v_dname_temp
		FROM  dept
		WHERE deptno = v_deptno;
	v_dname := v_dname_temp;
	v_sal := v_sal_temp;
	DBMS_OUTPUT.PUT_LINE('성        명 : '||v_ename);
	DBMS_OUTPUT.PUT_LINE('부서번호 : '||TO_CHAR(v_deptno));
	DBMS_OUTPUT.PUT_LINE('부  서  명 : '||v_dname_temp);
	DBMS_OUTPUT.PUT_LINE('급        여 : '||TO_CHAR(v_sal_temp,'$999,999'));
	RETURN v_deptno;
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('입력한 MANAGER는 없습니다.');
	WHEN TOO_MANY_ROWS THEN
		DBMS_OUTPUT.PUT_LINE('자료가 2건 이상입니다.');
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('기타 에러입니다.');
END;
/
SET VERIFY OFF
SET SERVEROUTPUT ON
ACCEPT p_deptno PROMPT '부서번호를 입력하시오 : '
DECLARE
	v_deptno		emp.deptno%TYPE := &p_deptno;
	v_empno		emp.empno%TYPE;
	v_ename		emp.ename%TYPE;
	v_sal			emp.sal%TYPE;
	v_sal_total		NUMBER(10,2) := 0;
	CURSOR emp_cursor IS
		SELECT     empno, ename, sal
			FROM		 emp
			WHERE		 deptno = v_deptno
			ORDER BY	 empno;
BEGIN
	OPEN emp_cursor;
  -- OPEN CURSOR : 메모리 공간을 할당 받음
	DBMS_OUTPUT.PUT_LINE ('사번    이름         급여');
	DBMS_OUTPUT.PUT_LINE ('---------------------------');
	LOOP
  -- FETCH ~ INTO : 커서 안에 있는 데이터를 select 하겠다.
		FETCH emp_cursor INTO v_empno, v_ename, v_sal;
		EXIT WHEN emp_cursor%NOTFOUND;
    -- EXIT WHEN : 조건문이 true일때 brak 시킨다
    -- 여기서는, FETCH된 행이 없을 때 ㅇㅇ
    -- PL/SQL에서는 한번에 한 행만 실행할 수 있기 때문에 여러 행의 처리가 필요한 경우에는 loop문을 사용한다.
			v_sal_total := v_sal_total + v_sal;
		DBMS_OUTPUT.PUT_LINE
		   (RPAD(v_empno,8)||RPAD(v_ename,8)||LPAD(TO_CHAR(v_sal, '$999,990.00'),12));
	END LOOP;
	DBMS_OUTPUT.PUT_LINE ('===========================');
	DBMS_OUTPUT.PUT_LINE (RTRIM(TO_CHAR(v_deptno))||'번 부서의 합 '||
		RPAD(TO_CHAR(v_sal_total,'$999,990.00'),13));
    -- 작업이 끝난 후에 할당받은 메모리 공간을 해제한다.
	CLOSE emp_cursor;
END;
/
SET VERIFY ON
SET SERVEROUTPUT OFF
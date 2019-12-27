SET VERIFY OFF
SET SERVEROUTPUT ON
ACCEPT p_deptno PROMPT '부서번호를 입력하세요(급여의 합을 구함) : '
DECLARE
	v_sal_total	NUMBER;
BEGIN
	SELECT SUM(sal)
 		INTO v_sal_total
		FROM emp
		WHERE deptno = &p_deptno;
	DBMS_OUTPUT.PUT_LINE
      (&p_deptno||'번 부서의 급여의 합 : '||
			LTRIM(TO_CHAR(v_sal_total, '$99,999,000')));
    -- LTRIM : 문자열의 좌측 공백을 절삭하는 것
    -- RTRIM : 문자열의 우측 공백을 절삭하는 것
END;
/
SET VERIFY ON
SET SERVEROUTPUT OFF
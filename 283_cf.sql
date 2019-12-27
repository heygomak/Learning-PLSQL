SET VERIFY OFF
SET SERVEROUTPUT ON
ACCEPT p_deptno PROMPT '부서번호를 입력하세요 : '
DECLARE
	v_sal_total	NUMBER;
BEGIN
	SELECT SUM(sal)
 		INTO v_sal_total
		FROM emp
		WHERE deptno = &p_deptno;
	IF v_sal_total IS NULL THEN
		DBMS_OUTPUT.PUT_LINE(&p_deptno||'번 부서는 해당자가 없습니다.');
	ELSE
		DBMS_OUTPUT.PUT_LINE
			(&p_deptno||'번 부서의 급여의 합 : '||
				 LTRIM(TO_CHAR(v_sal_total, '$99,999,000')));
	END IF;
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE (&p_deptno||'는 자료가 없습니다.');
	WHEN TOO_MANY_ROWS THEN
		DBMS_OUTPUT.PUT_LINE (&p_deptno||'번 부서가 중복입니다.');
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE ('기타 에러입니다.');
END;
/
SET VERIFY ON
SET SERVEROUTPUT OFF
-- 트리거로 접근제어를 할 수 있다
CREATE OR REPLACE TRIGGER emp_resource
	BEFORE insert OR update OR delete ON emp
BEGIN
	IF TO_CHAR(SYSDATE, 'DY') IN ('토','일')
		OR TO_NUMBER(TO_CHAR(SYSDATE, 'HH24'))
			NOT BETWEEN 9 AND 18 THEN
		RAISE_APPLICATION_ERROR(-20502, '작업할 수 없는 시간입니다.');
	END IF;
END;
/
-- Ʈ���ŷ� ������� �� �� �ִ�
CREATE OR REPLACE TRIGGER emp_resource
	BEFORE insert OR update OR delete ON emp
BEGIN
	IF TO_CHAR(SYSDATE, 'DY') IN ('��','��')
		OR TO_NUMBER(TO_CHAR(SYSDATE, 'HH24'))
			NOT BETWEEN 9 AND 18 THEN
		RAISE_APPLICATION_ERROR(-20502, '�۾��� �� ���� �ð��Դϴ�.');
	END IF;
END;
/
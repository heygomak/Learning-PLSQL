VARIABLE		row_deleted		VARCHAR2(60)

DECLARE
	v_ordid		NUMBER := 605;
BEGIN
	DELETE FROM item
		WHERE ordid = v_ordid;
	IF SQL%FOUND THEN
		:row_deleted := SQL%ROWCOUNT || ' rows deleted.';
	ELSE
		:row_deleted := '삭제한 자료가 없습니다.';
	END IF;
END;
/
PRINT row_deleted
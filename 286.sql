VARIABLE		row_deleted		VARCHAR2(60)

DECLARE
	v_ordid		NUMBER := 605;
BEGIN
	DELETE FROM item
		WHERE ordid = v_ordid;
	IF SQL%FOUND THEN
		:row_deleted := SQL%ROWCOUNT || ' rows deleted.';
	ELSE
		:row_deleted := '������ �ڷᰡ �����ϴ�.';
	END IF;
END;
/
PRINT row_deleted
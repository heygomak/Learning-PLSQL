SET SERVEROUTPUT ON
DECLARE
	V_STR	VARCHAR2(20) := NULL;
BEGIN
-- i_idx : for ~ loop������ �Ͻ������� ���� ����
	FOR i_idx IN REVERSE 1..20 LOOP
		v_str := v_str || '*';
		DBMS_OUTPUT.PUT_LINE(v_str || i_idx);
	END LOOP;
-- EXCEPTION
END;
/
SET SERVEROUTPUT OFF
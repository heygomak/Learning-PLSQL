SET SERVEROUTPUT ON
DECLARE
	v_cnt	number := 1;
	v_str		varchar2(10) := NULL;

BEGIN
	WHILE v_cnt <= 10 LOOP
		v_str := v_str || '*';
		DBMS_OUTPUT.PUT_LINE(v_str);
		v_cnt := v_cnt + 1;
	END LOOP;
-- EXCEPTION
END;
/
SET SERVEROUTPUT OFF

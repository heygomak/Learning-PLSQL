SET SERVEROUTPUT ON
DECLARE
	v_cnt	NUMBER := 1;
	v_str	 	VARCHAR2(20) := NULL;
BEGIN
	LOOP
		v_str := v_str || '*';
		DBMS_OUTPUT.PUT_LINE(v_str);
		v_cnt := v_cnt + 1;
		IF v_cnt >= 20 THEN
			EXIT;
		END IF;
	END LOOP;
END;
/
SET VERIFY ON
SET SERVEROUTPUT OFF
SET SERVEROUTPUT ON
DECLARE
	X	NUMBER;
	Y	NUMBER;
BEGIN
	x := 1;
	y := 2;

	DBMS_OUTPUT.PUT_LINE
	   ('X = ' || TO_CHAR(x)||'   '||'Y = '|| TO_CHAR(y));

	DECLARE
		y	NUMBER;
		Z	NUMBER;
	BEGIN
		DBMS_OUTPUT.PUT_LINE
		   ('X = '||TO_CHAR(x)||'   '|| 'Y =  ' || TO_CHAR(y)||'   '||'Z = '||TO_CHAR(z));
		x := 3;
		y := 4;
		z := 5;
		DBMS_OUTPUT.PUT_LINE
		   ('X = '||TO_CHAR(x)||'   '||'Y = ' || TO_CHAR(y)||'   '||'Z = '||TO_CHAR(z));
	END;
	DBMS_OUTPUT.PUT_LINE
	   ('X = '||TO_CHAR(x)||'   '||'Y = ' || TO_CHAR(y)||'   '||'Z = '||TO_CHAR('참조 불가능'));
--  DBMS_OUTPUT.PUT_LINE
--  ('z = '||TO_CHAR(z));
END;
/
SET SERVEROUTPUT OFF
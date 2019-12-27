DROP TABLE even_odd;
CREATE TABLE even_odd (
	id		NUMBER(4) CONSTRAINT even_odd_id_pk PRIMARY KEY,
	gubun	VARCHAR2(4));
SET VERIFY OFF
SET SERVEROUTPUT ON
ACCEPT	p_start	PROMPT	'START 숫자를 입력하세요 : '
ACCEPT	p_end	PROMPT	'END 숫자를 입력하세요 : '
DECLARE
--	v_start		even_odd.id%TYPE := &p_start;
--	v_end		even_odd.id%TYPE := &p_end;
BEGIN
	IF &p_start > &p_end THEN
		DBMS_OUTPUT.PUT_LINE ('START 숫자가 END 숫자보다 큽니다.');
	ELSE
		DELETE FROM even_odd;
		FOR i_idx IN &p_start .. &p_end LOOP
			IF MOD(i_idx,2) = 0 THEN
				INSERT INTO even_odd
				VALUES (i_idx, '짝수');
			ELSE
				INSERT INTO even_odd
				VALUES (i_idx, '홀수');
			END IF;
		END LOOP;
		DBMS_OUTPUT.PUT_LINE
		   (&p_start||'부터 '||&p_end||'까지 '||TO_CHAR(&p_end - &p_start +1)||'건의 자료가 입력되었습니다.');
	END IF;
END;
/
SET VERIFY ON
SET SERVEROUTPUT OFF
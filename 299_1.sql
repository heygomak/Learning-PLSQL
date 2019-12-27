DROP TABLE even_odd;
CREATE TABLE even_odd (
	id		NUMBER(4) CONSTRAINT even_odd_id_pk PRIMARY KEY,
	gubun	VARCHAR2(4));
SET VERIFY OFF
SET SERVEROUTPUT ON
ACCEPT	p_start	PROMPT	'START ���ڸ� �Է��ϼ��� : '
ACCEPT	p_end	PROMPT	'END ���ڸ� �Է��ϼ��� : '
DECLARE
--	v_start		even_odd.id%TYPE := &p_start;
--	v_end		even_odd.id%TYPE := &p_end;
BEGIN
	IF &p_start > &p_end THEN
		DBMS_OUTPUT.PUT_LINE ('START ���ڰ� END ���ں��� Ů�ϴ�.');
	ELSE
		DELETE FROM even_odd;
		FOR i_idx IN &p_start .. &p_end LOOP
			IF MOD(i_idx,2) = 0 THEN
				INSERT INTO even_odd
				VALUES (i_idx, '¦��');
			ELSE
				INSERT INTO even_odd
				VALUES (i_idx, 'Ȧ��');
			END IF;
		END LOOP;
		DBMS_OUTPUT.PUT_LINE
		   (&p_start||'���� '||&p_end||'���� '||TO_CHAR(&p_end - &p_start +1)||'���� �ڷᰡ �ԷµǾ����ϴ�.');
	END IF;
END;
/
SET VERIFY ON
SET SERVEROUTPUT OFF
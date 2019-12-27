DROP SEQUENCE emp_row_seq;
CREATE SEQUENCE emp_row_seq
	INCREMENT BY 1
	START WITH       1
	MAXVALUE         999999
	MINVALUE		1
	NOCYCLE
	NOCACHE;
DROP TABLE emp_row_tab;
CREATE TABLE emp_row_tab (
		e_id			NUMBER(6) CONSTRAINT emp_row_tab_e_id_tab_pk PRIMARY KEY,
		e_ename	VARCHAR2(30),
		e_gubun	VARCHAR2(10),
		e_date		DATE,
		e_empno	NUMBER(4),
		e_ddsal		NUMBER(7, 2),
		e_newsal	NUMBER(7, 2));

CREATE OR REPLACE TRIGGER emp_row_aud
	AFTER insert OR update OR delete ON emp
	FOR EACH ROW
BEGIN
	IF INSERTING THEN
		INSERT INTO emp_row_tab
		VALUES(emp_row_seq.NEXTVAL, USER, 'Inserting', SYSDATE, :NEW.empno, NULL, :NEW.sal);
	ELSIF UPDATING THEN
		INSERT INTO emp_row_tab
		VALUES(emp_row_seq.NEXTVAL, USER, 'Updating', SYSDATE, :OLD.empno, :OLD.sal, :NEW.sal);
	ELSIF DELETING THEN
		INSERT INTO emp_row_tab
		VALUES(emp_row_seq.NEXTVAL, USER, 'Deleting', SYSDATE, :OLD.empno, :OLD.sal, NULL);
	END IF;
END;
/
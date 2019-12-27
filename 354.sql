CREATE SEQUENCE emp_audit_tr
	INCREMENT BY 1
	START WITH       1
	MAXVALUE         999999
	MINVALUE          1
	NOCYCLE
	NOCACHE;

CREATE TABLE emp_audit (
	e_id			NUMBER(6) CONSTRAINT emp_audit_id_pk PRIMARY KEY,
	e_name		VARCHAR2(30),
	e_gubun	VARCHAR2(10),
	e_date		DATE);

CREATE OR REPLACE TRIGGER emp_audit_tr
	AFTER insert OR update OR DELETE ON emp
BEGIN
	IF INSERTING THEN
		INSERT INTO emp_audit
		VALUES (emp_audit_tr.NEXTVAL, USER, 'Inserting', SYSDATE);
	ELSIF UPDATING THEN
		INSERT INTO emp_audit
		VALUES (emp_audit_tr.NEXTVAL, USER, 'Updating', SYSDATE);
	ELSIF DELETING THEN
		INSERT INTO emp_audit
		VALUES (emp_audit_tr.NEXTVAL, USER, 'Deleting', SYSDATE);
	END IF;
END;
/
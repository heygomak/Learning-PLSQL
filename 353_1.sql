-- Ʈ���Ŵ� �޸𸮿� �����ϸ鼭 ��� sql���� ���͸��Ѵ�
-- ���� ���ϸ� ������ �� �ִ�

CREATE OR REPLACE TRIGGER emp_sal_chk
-- trigger�� ���� : before / after
BEFORE UPDATE OF sal ON emp
-- ������ Ʈ����� ������ �ѹ� �����ϴµ�, FOR EACH ROW�� ������ �� �ึ�� ������ ��
FOR EACH ROW WHEN 
	(NEW.sal < OLD.sal OR NEW.sal > OLD.sal * 1.1)
  -- NEW.sal : update �� ��, OLD.sal : update �ϱ� �� ��
BEGIN
	RAISE_APPLICATION_ERROR(-20502, 'May not decrease salary. Increase must be < 10%');
END;
/
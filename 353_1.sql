-- 트리거는 메모리에 상주하면서 모든 sql문을 필터링한다
-- 따라서 부하를 가져올 수 있다

CREATE OR REPLACE TRIGGER emp_sal_chk
-- trigger의 조건 : before / after
BEFORE UPDATE OF sal ON emp
-- 원래는 트랜잭션 단위로 한번 동작하는데, FOR EACH ROW가 있으면 각 행마다 동작을 함
FOR EACH ROW WHEN 
	(NEW.sal < OLD.sal OR NEW.sal > OLD.sal * 1.1)
  -- NEW.sal : update 된 값, OLD.sal : update 하기 전 값
BEGIN
	RAISE_APPLICATION_ERROR(-20502, 'May not decrease salary. Increase must be < 10%');
END;
/
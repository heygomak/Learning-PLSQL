BEGIN
--		<<outer_loop>>
		LOOP
				v_count := v_count + 1;
				EXIT WHEN v_counter > 10;

--				<<inner_loop>>
				LOOP
--						........
						EXIT outer_loop WHEN total_done = 'YES';
--						........
						EXIT WHEN inner_done = 'YES';
--						........
				END LOOP inner_loop;
--						........
		END LOOP outer_loop;
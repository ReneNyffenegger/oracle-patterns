--
-- 5 = 2+3
--
insert into recursive_additions values ( 5, 2);
insert into recursive_additions values ( 5, 3);

--
-- 18 = 11+7
--
insert into recursive_additions values (18,11);
insert into recursive_additions values (18, 7);

-- 
-- 17 = 9+8
-- 
insert into recursive_additions values (17, 9);
insert into recursive_additions values (17, 8);

-- 
-- 26 = 13+1+12
-- 
insert into recursive_additions values (26,13);
insert into recursive_additions values (26, 1);
insert into recursive_additions values (26,12);

-- 
-- 15=10+5
-- 
insert into recursive_additions values (15,10);
insert into recursive_additions values (15, 5);

--
-- 38=15+17+6
--
insert into recursive_additions values (38,15);
insert into recursive_additions values (38,17);
insert into recursive_additions values (38, 6);

--
-- 38, 26 and 18 have no parents (the parent is null)
--
insert into recursive_additions values (null, 38);
insert into recursive_additions values (null, 26);
insert into recursive_additions values (null, 18);


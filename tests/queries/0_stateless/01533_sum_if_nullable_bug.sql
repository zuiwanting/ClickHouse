drop table if exists T;
create table T(a Nullable(Int64)) engine = Memory();
insert into T values (1), (2), (3), (4), (5);
select sumIf(42, (a % 2) = 0) from T;
select sumIf(42, (a % 2) = 0) from remote('127.0.0.{1,2}', currentDatabase(), T);
select sumIf(42, toNullable(1)) from T;
select sumIf(42, toNullable(1)) from remote('127.0.0.{1,2}', currentDatabase(), T);
-- select sumIf(42, toNullable(toInt64(1))) from T;
-- select sumIf(42, toNullable(toInt64(1))) from remote('127.0.0.{1,2}', currentDatabase(), T);
drop table if exists T;

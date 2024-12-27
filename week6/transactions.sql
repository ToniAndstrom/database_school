--transactions
set autocommit=0;--autocommit is off
start transaction;
select @avg:=round(avg(salary),2) from employee;
update employee set salary = @avg where salary<@avg;
--either do:
rollback; --to reject changes(jos mokaat jotain ennen kun commit niin saat vanhan takas)
--or
commit; -- to accept changes
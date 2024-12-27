-- transactions
set autocommit=0;
start transaction;
select @avg:=round(avg(salary),2) from employee;
update employee set salary=@avg where salary<@avg;
-- either do
commit; -- to accept changes
-- or
rollback; -- to reject changes
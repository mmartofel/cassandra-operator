create keyspace mykeyspace with replication = {'class':'SimpleStrategy','replication_factor' : 3};

use mykeyspace;

create table usertable (userid int primary key, usergivenname varchar, userfamilyname varchar, userprofession varchar);

insert into usertable (userid, usergivenname, userfamilyname, userprofession) values (1, 'Oliver', 'Veits', 'Freelancer');
insert into usertable (userid, usergivenname, userfamilyname, userprofession) values (2, 'Marek', 'Martofel', 'Piper');

select * from usertable where userid = 1;
select * from usertable;


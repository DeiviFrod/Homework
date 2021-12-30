-- 1)Ñîçäàòü òàáëèöó employees - id. serial,  primary key, employee_name. Varchar(50), not null

create table employees ( 
	id serial primary key,
	employee_name varchar(50) not null
);

select * from employees;

--2) Íàïîëíèòü òàáëèöó employee 70 ñòðîêàìè.
insert into employees (employee_name)
values ('Kathy'),('Shawn'),('Sandra'),('Pauline'),('Patricia'),('Christopher'),('Edward'),('Judith'),('Jennifer'),('Julie'),('Shirley'),('Kathy'),('Brandon'),
('Dennis'),('Rene'),('Michael'),('Monica'),('Deborah'),('Gloria'),('Brian'),('Teresa'),('Stephanie'),('Lauren'),('Tracy'),('Virginia'),('Margaret'),('Thomas'),
('William'),('Pamela'),('Norman'),('Rosa'),('Kenneth'),('Charles'),('Karen'),('Edward'),('Cindy'),('Lois'),('Michelle'),('Harold'),('Connie'),('Travis'),
('Lillie'),('Phillip'),('Steven'),('Lori'),('Dawn'),('Philip'),('Chad'),('Peggy'),('Carol'),('Karen'),('Esther'),('Christine'),('Edward'),('Carol'),('Claude'),
('Paul'),('Anna'),('Michael'),('Carlos'),('Donald'),('Jenny'),('Juan'),('Diane'),('Carmen'),('Brett'),('Beverly'),('Larry'),('John'),('Kimberly');

-- 3) Ñîçäàòü òàáëèöó salary -id. Serial  primary key, - monthly_salary. Int, not null
create table salary1 (
	id serial primary key,
	monthly_salary int not null
);

select * from salary1;

--4) Íàïîëíèòü òàáëèöó salary 15 ñòðîêàìè
insert into salary1 (monthly_salary)
values (1000),(1100),(1200),(1300),(1400),(1500),(1600),(1700),(1800),(1900),(2000),(2100),(2200),(2300),(2400),(2500);

--5) Ñîçäàòü òàáëèöó employee_salary - id. Serial  primary key, - employee_id. Int, not null, unique - salary_id. Int, not null
create table employee_salary ( 
	id serial primary key,
	employee_id int not null unique,
	salary_id int not null
);

select * from employee_salary;
drop table employee_salary

--6)Íàïîëíèòü òàáëèöó employee_salary 40 ñòðîêàìè: - â 10 ñòðîê èç 40 âñòàâèòü íåñóùåñòâóþùèå employee_id
insert into employee_salary (employee_id, salary_id)
values (1, 6),(2,7),(3,11),(4,15),(5,13),(6, 15),(7,4),(8,11),(9,1),(10,13),(11, 3),(12,3),(13,11),(14,6),(15,11),(16, 7),(17,4),(18,11),(19,1),(20,8),
(21, 2),(22,8),(23,11),(24,15),(25,1),(26, 5),(27,1),(28,11),(29,2),(30,1),(98, 7),(99,3),(100,11),(77,8),(87,9),(91, 7),(92,4),(93,1),(94,9),(95,9);

--7)Ñîçäàòü òàáëèöó roles - id. Serial  primary key, - role_name. int, not null, unique
create table roles1 ( 
	id serial primary key,
	role_name int not null unique
);

select * from roles1;

--8)Ïîìåíÿòü òèï ñòîëáà role_name ñ int íà varchar(30)
alter table roles1
alter column role_name type varchar(30) using role_name::varchar(30);

--9)Íàïîëíèòü òàáëèöó roles 20 ñòðîêàìè:

insert into roles1 (role_name)
values ('Junior Python developer'),('Middle Python developer'),('Senior Python developer'),('Junior Java developer'),('Middle Java developer'),
('Senior Java developer'),('Junior JavaScript developer'),('Middle JavaScript developer'),('Senior JavaScript developer'),('Junior Manual QA engineer'),
('Middle Manual QA engineer'),('Senior Manual QA engineer'),('Project Manager'),('Designer'),('HR'),
('SEO'),('Sales manager'),('Junior Automation QA engineer'),('Middle Automation QA engineer'),('Senior Automation QA engineer');

--10)Ñîçäàòü òàáëèöó roles_employee 
-- id. Serial  primary key, 
-- employee_id. Int, not null, unique (âíåøíèé êëþ÷ äëÿ òàáëèöû employees, ïîëå id)
-- role_id. Int, not null (âíåøíèé êëþ÷ äëÿ òàáëèöû roles, ïîëå id)
create table roles_employee ( 
	id serial primary key,
	employee_id int not null unique,
	role_id int not null,
	foreign key (employee_id)
		references employees (id),
	foreign key (role_id)
		references roles1(id)	
);

select * from roles_employee;

--11)Íàïîëíèòü òàáëèöó roles_employee 40 ñòðîêàìè:
insert into roles_employee (employee_id, role_id)
values (7,2),(20,4),(3,9),(5,13),(23,4),(11,2),(10,9),(22,13),(21,3),(34,4),(6,7),
(31,4),(32,2),(33,1),(35,11),(36,14),(37,2),(38,9),(39,13),(40,3),(41,4),
(42,2),(43,4),(44,9),(45,13),(46,4),(47,2),(48,9),(49,13),(50,3),(51,4),
(59,4),(60,2),(61,1),(62,11),(63,14),(64,2),(65,9),(66,13),(67,3);


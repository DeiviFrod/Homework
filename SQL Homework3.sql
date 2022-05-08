select * from employees;
select * from salary1;
select * from roles1;
select * from roles_employee;
select * from employee_salary;
--1. ������� ���� ���������� ��� �������� ���� � ����, ������ � ����������.
select employee_name, monthly_salary from employees 
	join employee_salary on employees.id = employee_salary.employee_id 
	join salary1 on employee_salary.salary_id = salary1.id;

--2. ������� ���� ���������� � ������� �� ������ 2000
select employee_name, monthly_salary from employees
	join employee_salary on employees.id = employee_salary.employee_id 
	join salary1 on employee_salary.salary_id = salary1.id
where monthly_salary <2000;

-- 3. ������� ��� ���������� �������, �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)
--1)
select monthly_salary , employee_id from employee_salary es
left join salary1 s on s.id = es.salary_id 
left join employees e on e.id = es.employee_id
where e.employee_name is null;
--2)
select * from employee_salary es 
full join salary1 s on es.salary_id = s.id
where employee_id is null;

-- 4. ������� ��� ���������� �������  ������ 2000 �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)
--1)
select monthly_salary , employee_id from employee_salary es
left join salary1 s on s.id = es.salary_id 
left join employees e on e.id = es.employee_id
where e.employee_name is null and monthly_salary <2000;
--2)
select * from employee_salary es 
full join salary1 s on es.salary_id = s.id
where employee_id is null and monthly_salary <2000;

-- 5. ����� ���� ���������� ���� �� ��������� ��.
select e.id , e.employee_name, salary_id from employee_salary es 
full join employees e on e.id = es.employee_id
where salary_id is null;

-- 6. ������� ���� ���������� � ���������� �� ���������.
select employee_name, role_name from roles_employee re 
join employees e on e.id = re.employee_id
join roles1 r on r.id = re.role_id ;

-- 7. ������� ����� � ��������� ������ Java �������������.
select employee_name, role_name from roles_employee re 
join employees e on e.id = re.employee_id 
join roles1 r on r.id = re.role_id
--where role_name like '%Java %';  ������ �� �����
where role_id in (4,5,6); -- �� id

-- 8. ������� ����� � ��������� ������ Python �������������.
select employee_name, role_name from roles_employee re 
join roles1 r on r.id = re.role_id
join employees e on e.id = re.employee_id 
--where role_name like '%Python%';    ������ �� �����
where role_id in (1,2,3); --������ �� id ����

-- 9. ������� ����� � ��������� ���� QA ���������.
select employee_name, role_name from roles_employee re 
join employees e ON e.id = re.employee_id 
join roles1 r on r.id = re.role_id 
where role_id in (10,11,12,18,19,20);
--where role_name like '%QA%';

-- 10. ������� ����� � ��������� ������ QA ���������.
select * from roles_employee re 
join employees e on e.id = re.employee_id 
join roles1 r ON r.id = re.role_id 
where role_id in (10,11,12);
--where role_name like '%Manual QA%'

-- 11. ������� ����� � ��������� ��������������� QA
select * from roles_employee re 
join employees e on e.id = re.employee_id 
join roles1 r on r.id = re.role_id
where role_id in (18,19,20);
--where role_name like '%Automation QA%';

-- 12. ������� ����� � �������� Junior ������������
select employee_name , monthly_salary, role_name from employees e 
join roles_employee re on e.id = re.employee_id 
join roles1 r on re.role_id = r.id 
join employee_salary es on e.id = es.employee_id 
join salary1 s on es.salary_id = s.id 
where role_name like '%Junior%'

--13.  13. ������� ����� � �������� Middle ������������
select employee_name , monthly_salary, role_name from employees e 
join roles_employee re on e.id = re.employee_id 
join roles1 r on re.role_id = r.id 
join employee_salary es on e.id = es.employee_id 
join salary1 s on es.salary_id = s.id 
where role_name like '%Middle%'

-- 14. ������� ����� � �������� Senior ������������
select employee_name , monthly_salary, role_name from employees e 
join roles_employee re on e.id = re.employee_id 
join roles1 r on re.role_id = r.id 
join employee_salary es on e.id = es.employee_id 
join salary1 s on es.salary_id = s.id 
where role_name like '%Senior%';

-- 15. ������� �������� Java �������������
select monthly_salary, role_name from employees e 
join roles_employee re on e.id = re.employee_id 
join roles1 r on re.role_id = r.id 
join employee_salary es on e.id = es.employee_id 
join salary1 s on es.salary_id = s.id 
where role_name like '%Java%';

-- 16. ������� �������� Python �������������
select monthly_salary, role_name from employees e 
join roles_employee re on e.id = re.employee_id 
join roles1 r on re.role_id = r.id 
join employee_salary es on e.id = es.employee_id 
join salary1 s on es.salary_id = s.id 
where role_name like '%Python%';
 
-- 17. ������� ����� � �������� Junior Python �������������
select employee_name , monthly_salary, role_name from employees e 
join roles_employee re on e.id = re.employee_id 
join roles1 r on re.role_id = r.id 
join employee_salary es on e.id = es.employee_id 
join salary1 s on es.salary_id = s.id 
where role_name like '%Junior Python%';

-- 18. ������� ����� � �������� Middle JS �������������
select employee_name , monthly_salary, role_name from employees e 
join roles_employee re on e.id = re.employee_id 
join roles1 r on re.role_id = r.id 
join employee_salary es on e.id = es.employee_id 
join salary1 s on es.salary_id = s.id 
where role_name like '%Middle JavaScript%';

-- 19. ������� ����� � �������� Senior Java �������������
select employee_name , monthly_salary, role_name from employees e 
join roles_employee re on e.id = re.employee_id 
join roles1 r on re.role_id = r.id 
join employee_salary es on e.id = es.employee_id 
join salary1 s on es.salary_id = s.id 
where role_name like '%Senior Java%';

-- 20. ������� �������� Junior QA ���������
select monthly_salary, role_name from employees e 
join roles_employee re on e.id = re.employee_id 
join roles1 r on re.role_id = r.id 
join employee_salary es on e.id = es.employee_id 
join salary1 s on es.salary_id = s.id 
where role_name like '%Junior Manual QA%';

-- 21. ������� ������� �������� ���� Junior ������������
select AVG (monthly_salary) from employees e 
join roles_employee re on e.id = re.employee_id 
join roles1 r on re.role_id = r.id 
join employee_salary es on e.id = es.employee_id 
join salary1 s on es.salary_id = s.id 
where role_name like '%Junior%';

--22. ������� ����� ������� JS �������������
select  SUM (monthly_salary) from employees e 
join roles_employee re on e.id = re.employee_id 
join roles1 r on re.role_id = r.id 
join employee_salary es on e.id = es.employee_id 
join salary1 s on es.salary_id = s.id 
where role_name like '%JavaScript';

-- 23. ������� ����������� �� QA ���������
select min (monthly_salary)  from employees e 
join roles_employee re on e.id = re.employee_id 
join roles1 r on re.role_id = r.id 
join employee_salary es on e.id = es.employee_id 
join salary1 s on es.salary_id = s.id 
where role_name like '%QA%';

-- 24. ������� ������������ �� QA ���������
select max(monthly_salary)  from employees e 
join roles_employee re on e.id = re.employee_id 
join roles1 r on re.role_id = r.id 
join employee_salary es on e.id = es.employee_id 
join salary1 s on es.salary_id = s.id 
where role_name like '%QA%';

-- 25. ������� ���������� QA ���������
select count (role_name) from roles_employee re 
join employees e ON e.id = re.employee_id 
join roles1 r on r.id = re.role_id 
where role_name like '%QA%';

-- 26. ������� ���������� Middle ������������.
select count (role_name) from roles_employee re 
join employees e ON e.id = re.employee_id 
join roles1 r on r.id = re.role_id 
where role_name like '%Middle%';

-- 27. ������� ���������� �������������
select count (role_name) from roles_employee re 
join employees e ON e.id = re.employee_id 
join roles1 r on r.id = re.role_id 
where role_name like '%developer%';

--28. ������� ���� (�����) �������� �������������.
select  SUM (monthly_salary) from employees e 
join roles_employee re on e.id = re.employee_id 
join roles1 r on re.role_id = r.id 
join employee_salary es on e.id = es.employee_id 
join salary1 s on es.salary_id = s.id 
where role_name like '%developer%';

--29. ������� �����, ��������� � �� ���� ������������ �� �����������
select employee_name , role_name, monthly_salary  from employees e 
join roles_employee re on e.id = re.employee_id 
join roles1 r on re.role_id = r.id 
join employee_salary es on e.id = es.employee_id 
join salary1 s on es.salary_id = s.id
order by monthly_salary

-- 30. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� �� 1700 �� 2300
select employee_name , role_name, monthly_salary  from employees e 
join roles_employee re on e.id = re.employee_id 
join roles1 r on re.role_id = r.id 
join employee_salary es on e.id = es.employee_id 
join salary1 s on es.salary_id = s.id
where monthly_salary between 1700 and 2300
order by monthly_salary;

-- 31. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ������ 2300
select employee_name , role_name, monthly_salary  from employees e 
join roles_employee re on e.id = re.employee_id 
join roles1 r on re.role_id = r.id 
join employee_salary es on e.id = es.employee_id 
join salary1 s on es.salary_id = s.id
where monthly_salary <2000
order by monthly_salary;

--32. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ����� 1100, 1500, 2000
select employee_name , role_name, monthly_salary  from employees e 
join roles_employee re on e.id = re.employee_id 
join roles1 r on re.role_id = r.id 
join employee_salary es on e.id = es.employee_id 
join salary1 s on es.salary_id = s.id
where monthly_salary in (1100, 1500, 2000)
order by monthly_salary;


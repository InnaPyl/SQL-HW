--1.Создать таблицу employees

create table employees1 (
id serial primary key,
emp_name varchar(50) not null);

drop table employees1 ;
drop table roles_employee ;
--2.Наполнить таблицу employee 70 строками.

insert into employees1 (emp_name)
values ('Reggie Batey'), 
('Clara Poore'), 
('Tammy Galindo'), 
('Rickey Jones'), 
('Jill Anspach'), 
('Lacy Racicot'), 
('David Macias'), 
('Jessica Manns'), 
('Amber Holcomb'), 
('Betty Wells'), 
('Miguel Fletcher'), 
('Joseph Hodges'), 
('Ida Bohannon'), 
('Cindy Merrifield'), 
('Mary Dowell'), 
('Marie Thomas'), 
('Donald Fierro'), 
('Anna Wick'), 
('Robert Harian'), 
('Michael Mark'), 
('Lucius Patterson'), 
('Lorna Rose'), 
('Karen Santiago'), 
('Peggy Beachler'), 
('Chester Baird'), 
('Ronda Colley'), 
('Robert Chapman'), 
('Sandra Hibbard'), 
('Steven Pagano'), 
('Ramona Russell'), 
('Ryan Morgan'), 
('Shannon Daugherty'), 
('Charlene Little'), 
('Steve Lewandowski'), 
('Donnie Shoemaker'), 
('Veronica Treto'), 
('Jonathon Belanger'), 
('William Hughes'), 
('Courtney Alston'), 
('Isaac Walters'), 
('Leon Ashcraft'), 
('Daniel Patterson'), 
('Randall Phillips'), 
('James Williams'), 
('Nancy Searles'), 
('Edward Hilliard'), 
('Joel Vandevelde'), 
('Nancy Bravo'), 
('Jesse Clark'), 
('Gregory Magelssen'), 
('Ella Cortez'), 
('Michael Diaz'), 
('Robert Walsh'), 
('Valorie Seibert'), 
('Yoshiko Miller'), 
('Timothy Johnson'), 
('Lita Webb'), 
('Lindsay Barrera'), 
('Jacqulyn Matthews'), 
('Lee Rehart'), 
('Fred Spencer'), 
('Melinda Webster'), 
('Shawn Pretti'), 
('Betty Schaefer'), 
('Barbara Teets'), 
('Patricia Tomas'), 
('Mattie Kelley'), 
('Mary Yates'), 
('Andrea Croes'), 
('Amanda Riley');

select * from employees1 e ;

--3.Создать таблицу salary

create table salary (
id serial primary key,
monthly_salary int not null);

--4.Наполнить таблицу salary 15 строками:
insert into salary (monthly_salary)
values (1000),
(1100),
(1200),
(1300),
(1400),
(1500),
(1600),
(1700),
(1800),
(1900),
(2000),
(2100),
(2200),
(2300),
(2400);
select * from salary s ;

--5.Создать таблицу employee_salary
create table employee_salary (
id serial primary key,
employee_id int not null unique,
salary_id Int not null);

--6)Наполнить таблицу employee_salary 40 строками:
 --в 10 строк из 40 вставить несуществующие employee_id
insert into employee_salary (employee_id, salary_id )
values (3,7),
       (1,4),
       (5,9),  
       (40, 13),
       (23, 4),
       (11, 2),
       (52, 10),
       (15, 13),
       (26, 4),
       (16, 1),
       (33, 7),
       (2, 5),
       (39, 7),
       (65, 2),
       (48, 11),
       (43, 15),
       (17, 5),
       (29, 8),
       ( 25, 3),
       (58, 9),
       (37, 1),
       (6, 6),
       (61, 5),
       (24, 2),
       (38, 9),
       (45, 12),
       ( 9, 13),
       (60, 15),
       (4, 7),
       (8, 3);
      
insert into employee_salary (employee_id, salary_id )
values (71,10),
(72,9),
(73,8),
(74,7),
(75,6),
(76,8),
(77,9),
(78,10),
(79,11),
(80,10);

       
select * from employee_salary es ;  
--7.Создать таблицу roles
create table roles(
id serial primary key,
role_name int not null unique);
--8.Поменять тип столба role_name с int на varchar(30)
ALTER TABLE roles ALTER COLUMN role_name TYPE varchar(30);
--9.Наполнить таблицу roles 20 строками:
insert into roles (role_name)
values ('Junior Python developer'),
('Middle Python developer'),
('Senior Python developer'),
('Junior Java developer'),
('Middle Java developer'),
('Senior Java developer'),
('Junior JavaScript developer'),
('Middle JavaScript developer'),
('Senior JavaScript developer'),
('Junior Manual QA engineer'),
('Middle Manual QA engineer'),
('Senior Manual QA engineer'),
('Project Manager'),
('Designer'),
('HR'),
('CEO'),
('Sales manager'),
('Junior Automation QA engineer'),
('Middle Automation QA engineer'),
('Senior Automation QA engineer');

--10.Создать таблицу roles_employee
-- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
--role_id. Int, not null (внешний ключ для таблицы roles, поле id)
create table roles_employee(
id serial primary key,
employee_id Int not null unique,
role_id Int not null,
foreign key (employee_id )
references employees1 (ID),
foreign key (role_id)
references roles (ID));

--11.Наполнить таблицу roles_employee 40 строками:
insert into roles_employee(employee_id, role_id)
values (1,1),
(2,1),
(3,1),
(4,1),
(5,1),
(6,2),
(7,2),
(8,2),
(9,3),
(10,3),
(11,3),
(12,4),
(13,4),
(14,4),
(15,5),
(16,5),
(17,5),
(18,6),
(19,6),
(20,6),
(21,7),
(22,7),
(23,7),
(24,8),
(25,8),
(26,8),
(27,9),
(28,9),
(29,9),
(30,10),
(31,10),
(32,11),
(33,12),
(34,12),
(35,13),
(36,13),
(37,13),
(38,14),
(39,14),
(40,15);



select * from roles_employee re ;

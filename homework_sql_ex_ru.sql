
--1.Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd 

Select model, speed, hd from PC where price < 500;

--2. Найдите производителей принтеров. Вывести: maker
Select distinct (Maker) from Product where type= 'Printer';

--3.Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол. 
Select model,ram,screen from Laptop where price > 1000;

--4.Найдите все записи таблицы Printer для цветных принтеров.
Select * from Printer where color = 'y';

--5.Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.
Select model,speed,hd from PC where (cd='12x' or cd='24x') and price <600;

--6.Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, 
--найти скорости таких ПК-блокнотов. Вывод: производитель, скорость. 
Select distinct Product.maker, Laptop.speed from Product inner join Laptop on Product.model=Laptop.model
where laptop.hd >= 10;

--7.Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).
Select PC.model, PC.price 
from PC join Product on PC.model = Product.model
where Product.maker = 'B'
union 
select Laptop.model, Laptop.price 
from Laptop join Product on laptop.model = Product.model
where Product.maker = 'B'
union 
select Printer.model, Printer.price
from Printer join product on Printer.model = Product.model
where Product.maker = 'B';

--8.Найдите производителя, выпускающего ПК, но не ПК-блокноты. 
select maker  from Product where type = 'PC' 
except
select maker from Product where type='Laptop';

--9.Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker 
Select distinct maker from Product join PC on Product.model = PC.model
where speed >= 450;

--10.Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price
Select model, price from Printer 
where price in (select Max(price) from Printer )

--11.Найдите среднюю скорость ПК.
Select avg (speed) from PC;

--12.Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.
Select avg(speed) from Laptop where price > 1000;

--13.Найдите среднюю скорость ПК, выпущенных производителем A.
Select avg(speed) from PC join Product on Product.model=PC.model where maker = 'A';

--14.Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий.
Select Ships.class,Ships.name,Classes.country from ships join classes on classes.class=ships.class where classes.numGuns >=10;

--15.Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD
Select PC.hd from PC 
group by PC.hd
having count (hd) >=2;

--16. Найдите пары моделей PC, имеющих одинаковые скорость и RAM. В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i), Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.
select Distinct  B.model as model_2,  A.model AS model_1, A.speed, A.ram
from PC as A, PC as B
where A.speed=B.speed and A.ram=B.ram and A.model<B.model;


--17.Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК.
--Вывести: type, model, speed
Select distinct Product.type, Laptop.model, Laptop.speed from Laptop join Product on Product.model= Laptop.model  
where Laptop.speed < all (select PC.speed from PC);

--18.Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price
Select distinct Product.maker, Printer.price from Product join Printer on Product.model = Printer.model where 
Printer.color = 'y' and Printer.price = (select min (Printer.price) from Printer where 
Printer.color = 'y') ; 

--19.Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов.
--Вывести: maker, средний размер экрана.
Select Product.maker, avg (Laptop.screen) as avg_screen from Product join Laptop on Product.model=Laptop.model 
group by Product.maker;

--20.Найдите производителей, выпускающих по меньшей мере три различных модели ПК. Вывести: Maker, число моделей ПК.
Select Product.maker, count (distinct (Product.model) ) as count_models  from Product left join PC on Product.model= PC.model 
where Product.type ='PC' 
group by Product.maker
having count (distinct (Product.model) )  >=3; 

--21.Найдите максимальную цену ПК, выпускаемых каждым производителем, у которого есть модели в таблице PC.
--Вывести: maker, максимальная цена.
Select Product.maker, max (PC.price) from Product right join PC on Product.model= PC.model 
where Product.type = 'PC'
group by Product.maker  ; 

--22.Для каждого значения скорости ПК, превышающего 600 МГц, определите среднюю цену ПК с такой же скоростью. Вывести: speed, средняя цена.
Select PC.speed, avg (PC.price) as avg_speed from PC
where PC.speed > 600
group by PC.speed;

--23.Найдите производителей, которые производили бы как ПК со скоростью не менее 750 МГц, так и ПК-блокноты со скоростью не менее 750 МГц.
--Вывести: Maker
Select distinct Product.maker from Product  join  PC on Product.model= PC.model where PC.speed >= 750
intersect
select distinct Product.maker from Product  join  Laptop on Product.model= Laptop.model
where Laptop.speed >= 750;

--24.Перечислите номера моделей любых типов, имеющих самую высокую цену по всей имеющейся в базе данных продукции.
select model from PC
Where price = (select max (price) from 
(select price from PC 
union
select price from Laptop
union 
select price from printer))
union 
select model from Laptop
Where price = (select max (price) from 
(select price from PC 
union
select price from Laptop
union 
select price from printer))
union 
select model from Printer
Where price = (select max (price) from 
(select price from PC 
union
select price from Laptop
union 
select price from printer));

--25.Найдите производителей принтеров, которые производят ПК с наименьшим объемом RAM и с самым быстрым процессором среди всех ПК, 
--имеющих наименьший объем RAM. Вывести: Maker
Select distinct maker from Product left join PC on PC.model=Product.model where type ='Printer' 
and maker in (select maker from Product where model in (select model from PC where speed = (Select max(speed) from (select speed from PC where ram = (select min (ram) from PC)))));

--26.Найдите среднюю цену ПК и ПК-блокнотов, выпущенных производителем A (латинская буква). Вывести: одна общая средняя цена. 
select avg (price) from
(select PC.price  from Product  join PC on PC.model= Product.model
where Product.maker= 'A'
union all
select Laptop.price  from Product  join Laptop on Laptop.model= Product.model
where Product.maker= 'A');

--27Найдите средний размер диска ПК каждого из тех производителей, которые выпускают и принтеры. Вывести: maker, средний размер HD.
Select Product.maker, AVG (PC.hd) from Product join PC on Product.model=PC.model
where Product.maker in (select Product.maker from Product where type ='Printer' )
group by Product.maker ;















create database ExerciseDb1
use ExerciseDb1
---create table companyInfo and product info
create table CompanyInfo(
CId int primary key,
CName nvarchar(50)
)

insert into CompanyInfo (CId,CName) values (1,'Samsung')
insert into CompanyInfo (CId,CName) values (2,'HP')
insert into CompanyInfo (CId,CName) values (3,'Apple')
insert into CompanyInfo (CId,CName) values (4,'Dell')
insert into CompanyInfo (CId,CName) values (5,'Toshiba')
insert into CompanyInfo (CId,CName) values (6,'Redmi')

create table ProductInfo(
PId int primary key,
PName nvarchar(50),
PPrice decimal(10,2),
PMDate Date,
CId int references CompanyInfo(CId)
)
--(PId,PName,PPrice,PMDate,CId)
insert into ProductInfo(PId,PName,PPrice,PMDate,CId)values(101,'Laptop',55000.90,'12/12/2023',1)
insert into ProductInfo(PId,PName,PPrice,PMDate,CId)values(102,'Laptop',35000.90,'12/12/2012',2)
insert into ProductInfo values (103,'Mobile',15000.90,'12/03/2012',2)
insert into ProductInfo values(104,'Laptop',135000.90,'12/12/2012',3)
insert into ProductInfo values(105,'Mobile',65000.90,'12/12/2012',3)
insert into ProductInfo values(106,'Laptop',35000.90,'12/12/2012',5)
insert into ProductInfo values(107,'mobile',35000.90,'12/10/2012',5)
insert into ProductInfo values(108,'Earpod',1000.90,'12/10/2023',3)
insert into ProductInfo values(109,'Laptop',85000.90,'12/12/2021',6)
insert into ProductInfo values(110,'Mobile',55000.90,'12/12/2020',1)

----show all companies name and their products details
select C.CName,P.PName,P.PPrice,P.PMDate
from CompanyInfo C
join ProductInfo P on C.CId = P.CId

---select product name and company name
select P.PName,C.CName,P.PPrice,P.PMDate from ProductInfo P
join CompanyInfo C on P.CId = C.CId

---select all cobinations of company and product
select C.CName,P.PName from CompanyInfo C
Cross join ProductInfo P


-----------------------part 2-----------------------------
--create a product table
create table Products(
PId int primary key,
PQ int,
PPrice decimal(10,2),
Discount decimal(5,2))

INSERT INTO Products (Pid, PQ, PPrice, Discount)
VALUES
    (1, 10, 100.00, 10.00),
    (2, 5, 50.00, 5.00),
    (3, 20, 200.00, 15.00);

	----caluculate discounted value
	create function CalculateDiscountedValue (
    @Price decimal(10, 2),
    @Discount decimal(5, 2)
)
returns decimal(10, 2)
as
begin
    declare @DiscountedValue decimal(10, 2);
    set @DiscountedValue = @Price - (@Price * @Discount / 100);
    return @DiscountedValue;
end

------all the details of product
select
    Pid as PID,
    PPrice as Price,
    Discount,
    dbo.CalculateDiscountedValue(PPrice, Discount) as PriceAfterDiscount
from Products



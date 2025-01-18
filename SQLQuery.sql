-- Sử dụng Database
USE NORTHWND;

-- Thứ tự viết câu lệnh (từ trên xuống dưới) --
	SELECT DISTINCT product_id, COUNT(*) 
	FROM [dbo].[Products]
	WHERE status = 'shipped'
	GROUP BY product_id
	HAVING COUNT(*) > 5
	ORDER BY COUNT(*) DESC
	LIMIT 5;

-- Thứ tự thực thi câu lệnh --
-- FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> DISTINCT -> ORDER BY -> LIMIT 

--	SELECT FROM --
	-- Lấy ra tên tất cả các sản phẩm
	SELECT [ProductName]
	FROM [dbo].[Products];

	-- Lấy ra tên, giá bán, số lượng tất cả các sản phẩm
	SELECT [ProductName], [UnitPrice], [QuantityPerUnit]
	FROM [dbo].[Products];

	-- Lấy ra tên công ty và quốc gia của khách hàng
	SELECT [CompanyName], [Country]
	FROM [dbo].[Customers];

	-- Lấy ra tên và số điện thoại của tất cả nhà cung cấp
	SELECT [ContactName], [Phone]
	FROM [dbo].[Suppliers];

	-- Lấy tất cả dữ liệu từ bảng sản phẩm
	SELECT *
	FROM [dbo].[Products];

--	SELECT DISTINCT FROM --
	-- Lấy ra tên các quốc gia khác nhau của khách hàng
	SELECT DISTINCT [Country]
	FROM [dbo].[Customers];

	-- Lấy ra mã bưu điện khác nhau từ bảng nhà cung cấp
	SELECT DISTINCT [PostalCode]
	FROM [dbo].[Customers];

	-- Lấy ra tên, cách gọi lịch sự khác nhau của nhân viên 
	SELECT DISTINCT [LastName],
					[TitleOfCourtesy]
	FROM [dbo].[Employees];

	-- Lấy ra mã đơn vị vận chuyển khác nhau của đơn hàng
	SELECT DISTINCT [ShipVia]
	FROM [dbo].[Orders];

-- SELECT TOP FROM -- 
	-- Lấy ra 5 dòng đầu tiên trong bảng khách hàng
	SELECT TOP 5 *
	FROM [dbo].[Customers];

	-- Lấy ra 30% dòng đầu tiên của nhân viên
	SELECT TOP 30 PERCENT *
	FROM [dbo].[Employees];

	-- Lấy ra 5 mã khách hàng đầu tiên không trùng lặp
	SELECT DISTINCT TOP 5 [CustomerID]
	FROM [dbo].[Orders];

	-- Lấy ra 3 dòng đầu tiên có mã sản phẩm không trùng lặp
	SELECT DISTINCT TOP 3 [ProductID]
	FROM [dbo].[Products];

-- AS --
	-- Lấy tên công ty và đổi tên thành Công ty, mã bưu điện và đặt tên là Mã bưu điện
	SELECT [CompanyName] AS [Công ty],
			[PostalCode] AS [Mã bưu điện]
	FROM [dbo].[Customers];

	-- Lấy ra FirstName và đổi thành họ, LastName và đổi thành tên
	SELECT  [FirstName] AS [Họ],
			[LastName] AS [Tên]
	FROM [dbo].[Employees];

	-- Lấy ra 15 dòng đầu tiên khác nhau trong bảng Orders và đổi tên bảng thành Hóa đơn
	SELECT DISTINCT TOP 15 *
	FROM [dbo].[Orders] AS [Hóa đơn];

-- MAX/MIN --
	-- Lấy ra giá thấp nhất của Products và đổi tên thành giá thấp nhất 
	SELECT MIN([UnitPrice]) AS [Giá thấp nhất]
	FROM [dbo].[Products];

	-- Lấy ra ngày đặt hàng gần nhất từ Orders và đổi tên thành ngày gần nhất
	SELECT MAX([OrderDate]) AS [Ngày đặt hàng gần nhất]
	FROM [dbo].[Orders];

	-- Lấy ra UnitsInStock lớn nhất và đổi tên thanh số lượng hàng tồn kho lớn nhất
	SELECT MAX([UnitsInStock]) AS [Số lượng hàng tồn kho lớn nhất]
	From [dbo].[Products];

	-- Lấy ra ngày sinh của nhân viên có tuổi lớn nhất
	SELECT MIN([BirthDate])
	FROM [dbo].[Employees];

-- COUNT, SUM, AVG
	-- Lấy ra số lượng khách hàng
	SELECT COUNT(*) AS [Số lượng khách hàng]
	FROM [dbo].[Customers];

	-- lấy ra tổng Freight của tất cả đơn hàng
	SELECT SUM([Freight]) AS [Tổng tiền vận chuyển]
	FROM [dbo].[Orders];

	-- Lấy ra trung bình Quantity của Order Details]
	SELECT AVG([Quantity]) AS [Số lượng trung bình đặt hàng]
	FROM [dbo].[Order Details];

	-- Lấy ra số lượng, tính tổng của UnitsInStock và trung bình UnitPrice của Pri=oducts
	SELECT COUNT([UnitsInStock]) AS [Số lượng hàng tồn kho],
			SUM([UnitsInStock]) AS [Tổng lượng số hàng tồn kho],
			AVG([UnitPrice]) AS [Giá trung bình]
	FROM [dbo].[Products];

-- ORDER BY --
	-- Liệt kê Suppliers theo thứ tự từ A-Z
	SELECT *
	FROM [dbo].[Suppliers]
	ORDER BY [CompanyName] ASC;

	-- Liệt kê Products theo giá giảm dần
	SELECT *
	FROM [dbo].[Products]
	ORDER BY [UnitPrice] DESC;

	-- Liệt kê Employees theo LastName và FirstName tăng dần
	SELECT *
	FROM [dbo].[Employees]
	ORDER BY [LastName] ASC, [FirstName] ASC;

	-- Liệt kê Order Detail theo Quantity giảm dần
	SELECT *
	FROM [dbo].[Order Details]
	ORDER BY [Quantity] DESC;

	-- Liệt kê OrderID của Orders theo OrderDate giảm dần
	SELECT [OrderID]
	FROM [dbo].[Orders]
	ORDER BY [OrderDate] DESC;

	-- Liệt kê ProductName, UnitsInStock của Products theo UnitsInStock giảm dần
	SELECT [ProductName],
			[UnitsInStock]
	FROM [dbo].[Products]
	ORDER BY [UnitsInStock] DESC;

-- +, - , *, /, % --
	-- Lấy ra StockRemaining = UnitsInStock - UnitsOnOrder của Products
	SELECT  [ProductID],
			[ProductName],
			[UnitsInStock],
			[UnitsOnOrder],
			([UnitsInStock] - [UnitsOnOrder]) AS [StockRemaining]
	FROM [Products];

	-- Lấy ra OrderDetailValue = UnitPrice * Quantity của Order Details
	SELECT [UnitPrice],
			[Quantity],
			(UnitPrice * Quantity) AS [OrderDetailValue]
	FROM [dbo].[Order Details];

	-- Lấy ra FreightRatio = AVG(Freight) / MAX(Freight) của Orders
	SELECT  AVG(Freight) AS [AVG(Freight)],
			MAX(Freight) AS [MAX(Freight)],
			(AVG(Freight) / MAX(Freight)) AS [FreightRatio]
	FROM [dbo].[Orders];

	-- Liệt kê danh sách Products và UnitPrice của từng sản phẩm giảm đi 10%
	SELECT [ProductName], 
			[UnitPrice], 
			([UnitPrice] * 0.9) AS [DiscountedPrice]
	FROM [dbo].[Products];

-- WHERE --
	-- Lấy ra Employees có City = 'London'
	SELECT *
	FROM [dbo].[Employees]
	WHERE [City] = 'London';

	-- Lấy ra Orders có RequiredDate < ShippedDate
	SELECT *
	FROM [dbo].[Orders]
	WHERE [RequiredDate] < [ShippedDate];

	-- Lấy ra Order Details có Discount > 10%
	SELECT *
	FROM [dbo].[Order Details]
	WHERE [Discount] > 0.1;

	-- Lấy ra Orders có ShipCountry = 'France'
	SELECT *
	FROM [dbo].[Orders]
	WHERE [ShipCountry] = 'France';

-- AND, OR, NOT --
	-- Lấy ra Products trong khoảng UnitsInStock < 50 hoặc UnitsInStock > 100
	SELECT *
	FROM [dbo].[Products]
	WHERE [UnitsInStock] < 50 OR [UnitsInStock] > 100;

	-- Lấy ra Orders ShipCountry = 'Brazil', RequiredDate < ShippedDate
	SELECT *
	FROM [dbo].[Orders]
	WHERE [ShipCountry] = 'Brazil' AND [RequiredDate] < [ShippedDate];

	-- Lấy ra Products có UnitPrice < 100 và CategoryID != 1
	SELECT *
	FROM [dbo].[Products]
	WHERE NOT([UnitPrice] >= 100 AND [CategoryID] = 1);

	-- Lấy ra Products  có UnitsInStock > 20 và UnitsOnOrder < 20
	SELECT *
	FROM [dbo].[Products]
	WHERE [UnitsInStock] > 20 AND [UnitsOnOrder] < 20;

-- BETWEEN --
	-- Lấy ra Products có UnitPrice 10-20
	SELECT *
	FROM [dbo].[Products]
	WHERE [UnitPrice] BETWEEN 10 AND 20;

	-- Lấy ra Orders có OrderDate (1996-07-01)-(1996-07-31)
	SELECT *
	FROM [dbo].[Orders]
	WHERE [OrderDate] BETWEEN '1996-07-01' AND '1996-07-31';

	-- Lấy ra SUM(Freight) của Orders có OrderDate (1996-07-01)-(1996-07-31)
	SELECT SUM(Freight) AS [TotalJulyFreight]
	FROM [dbo].[Orders]
	WHERE [OrderDate] BETWEEN '1996-07-01' AND '1996-07-31';

	-- Lấy ra Orders có OrderDate (1996-07-01)-(1996-07-31) và ShipVia = 3
	SELECT * 
	FROM [dbo].[Orders]
	WHERE ([OrderDate] BETWEEN '1996-07-01' AND '1996-07-31') AND [ShipVia] = 3;

-- LIKE --
	-- Lấy ra Customers có Country bắt đầu bằng chữ 'A'
	SELECT *
	FROM [dbo].[Customers]
	WHERE [Country] LIKE 'A%';

	-- Lấy ra Orders có ShipCity chứa chữ 'a'
	SELECT *
	FROM [dbo].[Orders]
	WHERE [ShipCity] LIKE '%a%';

	-- Lấy ra Orders có ShipCountry chứa chữ bắt đầu là 'U' và sau nó là 1 chữ duy nhất
	SELECT *
	FROM [dbo].[Orders]
	WHERE [ShipCountry] LIKE 'U_';

-- WILDCARD --
-- % ,exe: bl% finds bl, black, blue,...
-- _ ,exe: h_t finds hot, hat, hit,...
-- [] ,exe: h[oat]t finds hot, hat, but not hit,...
-- ^ ,exe: h[^oa]t finds hit, but not hot, hat,...
-- - ,exe: c[a-z]t finds cat, cbt,..., cyt, czt
	-- Lấy ra Customers có ContactName chữ bắt đầu bằng 'A'
	SELECT *
	FROM [dbo].[Customers]
	WHERE [ContactName] LIKE 'A%';

	-- Lấy ra Customers có ContactName chữ bắt đầu bằng 'H' và chữ thứ 2 là chữ bất kỳ
	SELECT *
	FROM [dbo].[Customers]
	WHERE [ContactName] LIKE 'H_%';

	-- Lấy ra Orders ShipCity có chữ bắt đầu 'L' và chữ thứ 2 là 1 trong 'u' và 'o'
	SELECT *
	FROM [dbo].[Orders]
	WHERE [ShipCity] LIKE 'L[uo]%';

	-- Lấy ra Orders có ShipCity có chữ bắt đầu là 'L' chữ cái thứ 2 trong khoảng 'a' đến 'e'
	SELECT *
	FROM [dbo].[Orders]
	WHERE [ShipCity] LIKE 'L[a-e]%';

	-- Lấy ra Orders có ShipCountry có chữ bắt đầu không phải là 'U'
	SELECT *
	FROM [dbo].[Orders]
	WHERE [ShipCountry] LIKE '[^U]%';

-- IN/NOT IN --
	-- Lấy ra Orders có ShipCountry thuộc ('Germany', 'UK', 'Brazil')
	SELECT *
	FROM [dbo].[Orders]
	WHERE [ShipCountry] IN ('Germany', 'UK', 'Brazil');

	-- Lấy ra Orders có ShipCountry không thuộc ('Germany', 'UK', 'Brazil')
	SELECT *
	FROM [dbo].[Orders]
	WHERE [ShipCountry] NOT IN ('Germany', 'UK', 'Brazil');

-- IS NULL/IS NOT NULL
	-- Lấy ra Orders có ShipRegion mang giá trị NULL
	SELECT *
	FROM [dbo].[Orders]
	Where [ShipRegion] IS NULL;

	-- Lấy ra Orders có ShipRegion không mang giá trị NULL
	SELECT *
	FROM [dbo].[Orders]
	Where [ShipRegion] IS NOT NULL;

-- GROUP BY --
	-- Lấy ra CustomerID và TotalOrder = COUNT(OrderID) của Orders
	SELECT [CustomerID], COUNT([OrderID]) AS [TotalOrder]
	FROM [dbo].[Orders]
	GROUP BY [CustomerID];

	-- Lấy ra ProductID và AvgUnitPrice = AVG(UnitPrice) của Products
	SELECT  [ProductID],
			AVG([UnitPrice]) AS [AvgUnitPrice]
	FROM [dbo].[Products]
	GROUP BY [ProductID];

	-- Lấy ra CategoryID và SUM(UnitInStock) của Products
	SELECT  [CategoryID],
			SUM([UnitsInStock]) AS [SumUnitInStock]
	FROM [dbo].[Products]
	GROUP BY [CategoryID];

	-- Lấy ra ShipCity, ShipCountry, MIN(Freight), MAX(Freight) của Orders
	SELECT [ShipCity],
			[ShipCountry],
			MIN(Freight) AS [MinFreight],
			MAX(Freight) AS [MaxFreight]
	FROM [dbo].[Orders]
	GROUP BY [ShipCity], [ShipCountry];

-- DAY, MONTH, YEAR --
	-- Lấy ra Count(OrderID) trong năm 1997 của Orders
	SELECT [CustomerID],
			COUNT([OrderID]) AS [TotalOrder],
			YEAR([OrderDate]) AS [Year]
	FROM [dbo].[Orders]
	WHERE YEAR([OrderDate]) = 1997
	GROUP BY [CustomerID], YEAR([OrderDate]);

	-- Lấy ra Orders được đặt vào 1997/05
	SELECT *
	FROM [dbo].[Orders]
	WHERE YEAR([OrderDate]) = 1997 AND MONTH([OrderDate]) = 05;

	-- lấy ra Order được đặt vào 1996/09/04
	-- Cách 1:
	SELECT *
	FROM [dbo].[Orders]
	WHERE YEAR([OrderDate]) = 1996 AND
			MONTH([OrderDate]) = 09 AND
			DAY([OrderDate]) = 04;
	-- Cách 2:
	SELECT *
	FROM [dbo].[Orders]
	WHERE [OrderDate] = '1996/09/04';

-- Truy vấn dữ liệu từ nhiều Table --
	-- Lấy ra CategoryID, CategoryName, ProductID, ProductName từ Products và Categories
	SELECT c.[CategoryID],
			c.[CategoryName],
			p.[ProductID],
			p.[ProductName]
	FROM [dbo].[Products] AS p, 
		[dbo].[Categories] AS c
	WHERE p.[CategoryID] = c.[CategoryID] AND c.[CategoryName] = 'Seafood';

	-- Lấy SupplierID, Country = 'Germany', ProductID, ProductName từ Products, Suppliers
	SELECT s.[SupplierID],
			s.[Country],
			p.[ProductID],
			p.[ProductName]
	FROM [dbo].[Products] AS p,
		[dbo].[Suppliers] AS s
	WHERE s.[SupplierID] = p.[SupplierID] AND s.[Country] = 'Germany';

	-- Lấy ra OrderID, ContactName, CompanyName, City = 'London', từ Orders, Customers, Shippers
	SELECT o.OrderID, 
		c.ContactName, 
		s.CompanyName, 
		c.City
	FROM [dbo].[Orders] AS o,
		[dbo].[Customers] AS c,
		[dbo].[Shippers] AS s
	WHERE o.CustomerID = c.CustomerID AND 
		o.ShipVia = s.ShipperID AND 
		c.City = 'London';

	-- Lấy ra OrderID, ContactName, CompanyName, RequiredDate, ShippedDate, từ Orders, Customers, Shippers, yêu cầu RequiredDate > ShippedDate
	SELECT o.OrderID, 
		c.ContactName, 
		o.RequiredDate,
		o.ShippedDate,
		s.CompanyName
	FROM [dbo].[Orders] AS o,
		[dbo].[Customers] AS c,
		[dbo].[Shippers] AS s
	WHERE o.CustomerID = c.CustomerID AND 
		o.ShipVia = s.ShipperID AND 
		o.RequiredDate < o.ShippedDate;

-- UNION --
	SELECT DISTINCT Country
	FROM Suppliers
	UNION ALL
	SELECT DISTINCT Country
	FROM Customers;

-- JOIN/INNER JOIN --
	-- Lấy ra ProductName, ContactName, Order Details JOIN Products JOIN Suppliers 
	SELECT DISTINCT p.ProductName, s.ContactName
	FROM [dbo].[Order Details] AS od
	INNER JOIN [dbo].[Products] AS p
	ON od.ProductID = p.ProductID
	INNER JOIN [dbo].[Suppliers] AS s
	ON p.SupplierID = s.SupplierID;

	-- Lấy ra c.ContactName, p.ProductName, Orders INNER JOIN Customers INNER JOIN Order Details INNER JOIN Products
	SELECT c.ContactName, p.ProductName
	FROM Orders AS o
	INNER JOIN Customers AS c
	ON o.CustomerID = c.CustomerID
	INNER JOIN [Order Details] AS od
	ON o.OrderID = od.OrderID
	INNER JOIN Products AS p
	ON od.ProductID = p.ProductID
	ORDER BY c.ContactName ASC;

-- LEFT JOIN --
	-- Lấy ra c.ContactName, e.FirstName, e.LastName, Orders LEFT JOIN Customers LEFT JOIN Employees
	SELECT c.ContactName, e.FirstName, e.LastName
	FROM Orders AS o
	LEFT JOIN Employees AS e
	ON o.EmployeeID = e.EmployeeID
	LEFT JOIN Customers AS c
	ON c.CustomerID = o.CustomerID;

-- RIGHT JOIN --
	-- Lấy ra c.ContactName, e.FirstName, e.LastName Orders RIGHT JOIN Customers RIGHT JOIN Employees
	SELECT c.ContactName, e.FirstName, e.LastName
	FROM Orders AS o
	RIGHT JOIN Employees AS e
	ON o.EmployeeID = e.EmployeeID
	RIGHT JOIN Customers AS c
	ON c.CustomerID = o.CustomerID;

-- FULL JOIN --
	-- Lấy ra c.CategoryName, s.ContactName, Products FULL JOIN Categories FULL JOIN Suppliers
	SELECT p.ProductName, s.ContactName, c.CategoryName
	FROM Products AS p
	FULL JOIN Suppliers AS s
	ON p.SupplierID = s.SupplierID
	FULL JOIN Categories AS c
	ON p.CategoryID = c.CategoryID

-- Common Table Expression (CTE) --
	-- Lấy ra Orders, TotalPrice(Price = UnitPrice * Quantity)
	WITH OrderTotal AS (
		SELECT OrderID, SUM(UnitPrice * Quantity) AS TotalPrice
		FROM [Order Details]
		GROUP BY OrderID
	)

	SELECT --o.OrderID,
		--OrderDate,
		--Freight,
		*,
		ot.TotalPrice,
		ot.TotalPrice / o.Freight AS [TotalPrice/Freight]
	FROM Orders AS o
	JOIN OrderTotal AS ot
	ON o.OrderID = ot.OrderID

-- CREATE DATABASE --
	CREATE DATABASE NVDB
	CHARACTER SET utf8mb4
	COLLATE utf8mb4_unicode_ci;

-- CREATE TABLE --
	CREATE TABLE NhanVien(
		MaNV INT NOT NULL PRIMARY KEY,
		HoTen VARCHAR(50) NOT NULL,
		Phai VARCHAR(50),
		NgaySinh DATE,
		DiaChi VARCHAR(255),
		SDT VARCHAR(10)
	);

-- Thêm cột --
	ALTER TABLE NhanVien
	ADD Email VARCHAR(100);

	ALTER TABLE NhanVien
	ALTER COLUMN HoTen VARCHAR(100);

-- Đổi tên cột --
	EXEC sp_rename 'NhanVien.HoTen', 'FullName', 'COLUMN';

-- Xóa 1 cột --
	ALTER TABLE NhanVien
	DROP COLUMN FullName;

-- Xóa dữ liệu của 1 bảng --
	TRUNCATE TABLE NhanVien;

-- Xóa toàn bộ bảng --
	DROP TABLE NhanVien;

-- Thêm dữ liệu vào 1 bảng --
	-- Tạo lại bảng vì đã xóa trước đó
	-- CREATE TABLE NhanVien(
	-- 	MaNV INT NOT NULL PRIMARY KEY,
	-- 	HoTen VARCHAR(50) NOT NULL,
	-- 	Phai VARCHAR(50),
	-- 	NgaySinh DATE,
	-- 	DiaChi VARCHAR(255),
	-- 	SDT VARCHAR(10)
	-- );
	INSERT INTO [dbo].[NhanVien] ([MaNV], [HoTen], [Phai], [NgaySinh], [DiaChi], [SDT])
	VALUES 
		(1, 'Nguyen Hoang Hai', 'Nam', NULL, 'Buon Ma Thuot', '0782748863'),
		(2, 'Bui Thi Khanh Ha', 'Nu', NULL, 'Can Tho', '1234567890');

	INSERT INTO [dbo].[Suppliers] ([CompanyName], [ContactName], [Address], [City], [Region], [PostalCode], [Country], [Phone], [Fax], [HomePage])
	VALUES 
		('LongHai', 'Nguyen Hoang Hai', 'Nguyen Du', 'Buon Ma Thuot', 'Tay Nguyen', 63100, 'Viet Nam', '0782748863', NULL, NULL);

-- SELECT INTO --
	-- Tạo bảng mới với các sản phẩm có giá trên > 50
	SELECT *
	INTO PriceOver50 
	FROM [dbo].[Products]
	WHERE [UnitPrice] > 50;

	-- Tạo bảng mới với các đơn hàng giửi đến USA
	SELECT *
	INTO ShipToUSA
	FROM [dbo].[Orders]
	WHERE [ShipCountry] LIKE 'USA';

	-- Tạo bảng các đơn hàng ở Canada
	SELECT *
	INTO CustomerInCanada
	FROM [dbo].[Customers]
	WHERE [Country]LIKE 'Canada';

	-- Tạo bảng có TotalValue > 100
	SELECT 
		[OrderID],
		[ProductID],
		[UnitPrice],
		[Quantity],
		[Discount],
		SUM([UnitPrice]) AS TotalValue
	INTO TotalValueOver100
	FROM [dbo].[Order Details]
	GROUP BY 
		[OrderID],
		[ProductID],
		[UnitPrice],
		[Quantity],
		[Discount]
	HAVING SUM([UnitPrice]) > 100;

-- DELETE --
	-- Xóa dữ liệu có Quantity <= 20
	DELETE FROM TotalValueOver100 WHERE [Quantity] <= 20;

	-- Xóa toàn bộ dữ liệu trong bảng
	DELETE FROM TotalValueOver100;

	-- Xóa dữ liệu của đơn hàng có @OrderID(xóa dữ liệu ở bảng có liên kết với bảng qua OrderID)
	DECLARE @OrderID INT;
	SET @OrderID = 10248;

	DELETE FROM [dbo].[Order Details]
	WHERE OrderID = @OrderID;

	DELETE FROM [dbo].[Orders]
	WHERE OrderID = @OrderID;

-- UPDATE --
	-- Thay đổi [LastName] = 'Hai',[FirstName] = 'Nguyen' của [EmployeeID] = 1
	UPDATE [dbo].[Employees]
	SET 
		[LastName] = 'Hai',
		[FirstName] = 'Nguyen'
	WHERE [EmployeeID] = 1;

-- DROP DATABASE --
	-- Xóa một DATABASE
	USE master; ALTER DATABASE NVDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE; -- Nếu DATABASE lỗi không xóa được thì chạy câu lệnh này trước
	DROP DATABASE NVDB;

-- FUNCTION --
	CREATE FUNCTION calculate_salary(hours INT, base_salary DECIMAL(10, 2))
	RETURNS DECIMAL(10, 2)
	DETERMINISTIC
	BEGIN
		DECLARE total_salary DECIMAL(10, 2);
		SET total_salary = hours * base_salary;
		RETURN total_salary;
	END;

	SELECT name, calculate_salary(160, 5000) AS total_salary
	FROM [dbo].[Employees];

-- TRANSACTION --
	START TRANSACTION;

	-- Trừ 1.000 từ tài khoản A (ID = 1)
	UPDATE accounts
	SET balance = balance - 1000
	WHERE account_id = 1;

	-- Thêm 1.000 vào tài khoản B (ID = 2)
	UPDATE accounts
	SET balance = balance + 1000
	WHERE account_id = 2;

	-- Ghi vào bảng lịch sử giao dịch
	INSERT INTO transactions (sender_id, receiver_id, amount, transaction_date)
	VALUES (1, 2, 1000, NOW());

	-- Kiểm tra lỗi
	IF @@ERROR != 0 THEN
		-- Nếu có lỗi xảy ra, rollback tất cả thay đổi
		ROLLBACK;
	ELSE
		-- Nếu không có lỗi, commit giao dịch
		COMMIT;
	END IF;
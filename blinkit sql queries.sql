select * from blinkit


--SOME SQL ANALYSIS QUESTIONS!

--The overall revenue generated from all items sold.

SELECT CAST(SUM(sales) / 1000000.0 AS DECIMAL(10,2)) 
AS Total_Sales_Million
FROM blinkit;

--The average revenue per sale.

SELECT CAST(AVG(sales) AS INT) AS Avg_Sales
FROM blinkit;

--The total count of different items sold.

SELECT COUNT(*) AS No_of_Orders
FROM blinkit;

--The average customer rating for items sold. 

SELECT CAST(AVG(rating) AS DECIMAL(10,1)) AS Avg_Rating
FROM blinkit;

--Total Sales by Fat Content?

SELECT Item_Fat_Content, CAST(SUM(sales) AS DECIMAL(10,2)) AS Total_Sales
FROM blinkit
GROUP BY Item_Fat_Content

--Total Sales by Item Type?

SELECT Item_Type, CAST(SUM(sales) AS DECIMAL(10,2)) AS Total_Sales
FROM blinkit
GROUP BY Item_Type
ORDER BY Total_Sales DESC

--. Fat Content by Outlet for Total Sales?

    SELECT Outlet_Location_Type, Item_Fat_Content, 
           CAST(SUM(sales) AS DECIMAL(10,2)) AS Total_Sales
    FROM blinkit
    GROUP BY Outlet_Location_Type, Item_Fat_Content


--Total Sales by Outlet Establishment?

SELECT Outlet_Establishment_Year, CAST(SUM(sales) AS DECIMAL(10,2)) AS Total_Sales
FROM blinkit
GROUP BY Outlet_Establishment_Year
ORDER BY Outlet_Establishment_Year

--Percentage of Sales by Outlet Size?

SELECT 
    Outlet_Size, 
    CAST(SUM(sales) AS DECIMAL(10,2)) AS Total_Sales,
    CAST((SUM(sales) * 100.0 / SUM(SUM(sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage
FROM blinkit
GROUP BY Outlet_Size
ORDER BY Total_Sales DESC;

--Sales by Outlet Location?

SELECT Outlet_Location_Type, CAST(SUM(sales) AS DECIMAL(10,2)) AS Total_Sales
FROM blinkit
GROUP BY Outlet_Location_Type
ORDER BY Total_Sales DESC

--All Metrics by Outlet Type?


SELECT Outlet_Type, 
CAST(SUM(sales) AS DECIMAL(10,2)) AS Total_Sales,
		CAST(AVG(sales) AS DECIMAL(10,0)) AS Avg_Sales,
		COUNT(*) AS No_Of_Items,
		CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating,
		CAST(AVG(Item_Visibility) AS DECIMAL(10,2)) AS Item_Visibility
FROM blinkit
GROUP BY Outlet_Type
ORDER BY Total_Sales DESC










Select * From savitasboutique.supplier;

Select * From savitasboutique.customer;

Select * From savitasboutique.expenses;

-- Right Join between Two tables supplier and customer

Select A.Transaction_id, A.Date, B.Customer_Name, A.Quantity, A.Tax, 
A.Selling_Price, A.Cost_Price, A.Profit, A.Discount, A.Supplier_Name
From savitasboutique.customer As B
Right join savitasboutique.supplier As A
On A.Transaction_id = B.Transaction_id
Order By A.Transaction_id ASC;

-- Top 10 customers by Profit

Select B.Customer_Name, sum(A.Selling_Price) As Total_Profit
From savitasboutique.supplier As A Left Join Savitasboutique.customer As B 
On A.Transaction_id = B.Transaction_id
Group By B.Customer_Name
Order By Total_Profit DESC
Limit 10;

-- Top !0 most frequently visiting Customers 

Select count(Distinct A.Transaction_id) As Total, B.Customer_Name
From savitasboutique.supplier As A Left Join Savitasboutique.customer As B 
On A.Transaction_id = B.Transaction_id
Group by B.Customer_Name
Order by Total DESC
Limit 10;

-- Top 10 Customers by Quantiy Purchased

Select sum(A.Quantity) As Total_Quantity, B.Customer_Name
From savitasboutique.supplier As A Left Join Savitasboutique.customer As B 
On A.Transaction_id = B.Transaction_id
Group by B.Customer_Name
Order by Total_Quantity DESC
Limit 10;

-- Max Profit by customer in single transaction

Select B.Customer_Name, A.Supplier_Name, A.Quantity, Max(A.Profit) As Max_Profit
From savitasboutique.supplier As A Left Join Savitasboutique.customer As B 
On A.Transaction_id = B.Transaction_id
Group by B.Customer_Name, A.Supplier_Name, A.Quantity
Order by Max_Profit DESC
Limit 10;

-- Total Sales 

Select sum(A.Selling_Price) As Total_Sales
From savitasboutique.supplier As A Left Join Savitasboutique.customer As B 
On A.Transaction_id = B.Transaction_id;

-- Total Profit 

Select sum(A.Profit) As Total_Profit
From savitasboutique.supplier As A Left Join Savitasboutique.customer As B 
On A.Transaction_id = B.Transaction_id;

-- Total Quantity Sold

Select sum(A.Quantity) As Total_Quantity
From savitasboutique.supplier As A Left Join Savitasboutique.customer As B 
On A.Transaction_id = B.Transaction_id;

-- Total Discount

Select sum(A.Discount) As Total_Discount
From savitasboutique.supplier As A Left Join Savitasboutique.customer As B 
On A.Transaction_id = B.Transaction_id;

-- Average Discount

Select AVG(A.Discount) As Avg_Discount
From savitasboutique.supplier As A Left Join Savitasboutique.customer As B 
On A.Transaction_id = B.Transaction_id;

-- Using CASE Function..

Select Distinct A.Transaction_id,
CASE 
 When B.Customer_Name = 'Dr.Pallavi' then 'Dr.Pallavi Dharmadhikari'
 Else B.Customer_Name 
 End As cleaned_name
From savitasboutique.supplier As A Left Join Savitasboutique.customer As B 
On A.Transaction_id = B.Transaction_id;

-- Total Profit & Profit Percentage earn from every customer

Select B.Customer_Name,  sum(A.Profit) As Total_Profit, sum(A.Profit)/sum(A.Cost_Price)*100 As Profit_Percentage
From savitasboutique.supplier As A Left Join Savitasboutique.customer As B 
On A.Transaction_id = B.Transaction_id
Group by B.Customer_Name
Order by Total_Profit DESC;

-- Total Profit earned and Quantity purchased from every customer of specific supplier..  

Select  B.Customer_Name, Sum(A.Quantity) As Total_Quantity, Sum(A.Profit) AS Total_Profit 
From savitasboutique.supplier As A Left Join Savitasboutique.customer As B 
On A.Transaction_id = B.Transaction_id
Where A.Supplier_Name='Pehnava' or A.Supplier_Name='ADA'
Group By B.Customer_Name
Order By Total_Profit DESC;


-- Quantity Purchased for specific range of cost price..

Select Sum(A.Quantity) As Total_Quantity
From savitasboutique.supplier As A Left Join Savitasboutique.customer As B 
On A.Transaction_id = B.Transaction_id
Where A.Cost_Price Between 3000 And 10000;

-- Profit_Percentage of specific range of cost price.. 

Select B.Customer_Name, A.Supplier_Name, A.Selling_Price, A.Cost_Price, A.Discount, A.Profit, 
A.Profit/A.Cost_Price*100 As Profit_Percentage
From savitasboutique.supplier As A Left Join Savitasboutique.customer As B 
On A.Transaction_id = B.Transaction_id
Where A.Cost_Price Between 15000 And 25000
Order by Profit_Percentage DESC;
  
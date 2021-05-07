# Fall 2021 Data Science Intern Challenge (Amy Tai)

## Question 1
*Tool Used:* Excel 

*Work Location:* amytai-shopify-q1.xlsx

*Assumption:* order_amount is given in $ (based on statement that AOV is $3145.13).

### Part A
There are two parts to the order value: the number of units purchased and the unit cost per sneaker. 

The current calculation of the average order value (AOV) does not account for outliers in the size of each order or outliers in the unit cost per sneaker. It is likely that some stores may sell really expensive sneakers and some users may purchase a significantly large number of sneakers per order. Either behaviour would result in an average order value that is significantly more than expected. 

Upon closer inspection of the data, there are 17 data rows with the same user_id and shop_id with an order size of 2000 which results in an extremely higher order cost of $704,000. Additionally, the unit cost per sneaker for shop_id 78 is an extremely high value of $25,725 whereas the other shops have a unit cost below $360. After graphing a histogram of the order amount (shown in Figure 1), it is evident that there appears some outliers in the data attributed to the larger order size (or total_items) and the larger unit cost of a sneaker (calculated by dividing the order_amount by the total_items as "each of these shops sells only one model of shoe"). 

<p align="center">
  <img src="./Order Amount Histogram.JPG" alt="Histogram of Order Amounts"/>
</p>

**Figure 1.** Histogram of the order amount in the given 30 day sample dataset.

A better way to evaluate this data would be using a median or a trimmed mean. Both methods would be less sensitive to outliers. 

### Part B
I would report the trimmed mean for this dataset with 10% trimming as the trimmed mean captures more of the data than the median. The median only presents the midpoint of the data and disregards the other values. For instance, if the data was {1, 2, 3, 10, 40}, then the median would be 3. The other data points, e.g., 10 and 40, would be completely disregarded whereas the trimmed mean would only remove 10% of the data. 

### Part C
The value of the 10% trimmed mean is approximately $294.39. Interestingly enough, the median is $284 and has a close value to the 10% trimmed mean. 

## Question 2
*Tool Used:* SQL (W3 Schools)

*Code Location:* amytai-shopify-q2.sql

*Assumption:* There was only one employee and one product for Parts B and C. This assumption was validated through querying without this assumption, but required a more complicated query as seen in the code. 

### Part A
54 orders were shipped by Speedy Express in total.

### Part B
The last name of the employee with the most orders is Peacock.

### Part C
ProductID 31 was ordered the most by customers in Germany.
## Anomaly Analysis
1. Insert Anomaly
An insert anomaly occurs when new data cannot be added without requiring unrelated data.
Example:
A new product cannot be inserted unless an order exists for it.
From the dataset:
Columns: product_id, product_name, category, unit_price
Example row: Row 12 
If the company wants to add a new product (e.g., P200 – Bluetooth Speaker), it cannot be inserted unless an order is created. This is because product data is tightly coupled with order data.

2. Update Anomaly
An update anomaly occurs when the same data is repeated across multiple rows and must be updated in multiple places.
Example:
Sales representative office details are duplicated.
From the dataset:
Columns: sales_rep_id, sales_rep_name, office_address
Example rows: Row 5 and Row 18
If the Delhi office address changes, it must be updated in every row where SR02 appears. Missing even one row leads to inconsistent data.

3. Delete Anomaly
A delete anomaly occurs when deleting a row removes important data unintentionally.
Example:
Columns: product_id, product_name, category
Example rows: Row 2
product_id = P004
If this is the only order for this product and the row is deleted, all information about this product is lost.

## Normalization Justification
While keeping all data in a single table may seem simpler, the structure of orders_flat.csv clearly shows that this approach leads to redundancy, inconsistency, and maintenance challenges. Therefore, normalization is not over-engineering but a necessary step to ensure data integrity and scalability.
For instance, customer details such as customer_name, customer_email, and customer_city are repeated across multiple rows for every order placed by the same customer. If a customer updates their email address, it must be changed in every row where that customer appears. Missing even one update would result in inconsistent data, demonstrating an update anomaly.
Similarly, product information like product_name, category, and unit_price is duplicated for each order containing that product. If the price of a product changes, multiple records must be updated, increasing the risk of errors. This redundancy also wastes storage and reduces efficiency.
Sales representative data such as sales_rep_name and office_address is also repeated across rows. Any change in office location would require updating numerous records, further increasing the likelihood of inconsistencies.
Additionally, the current structure causes insert and delete anomalies. A new product cannot be added without creating an order, and deleting an order may remove all information about a product or customer if it exists only in that row.
By normalizing the data into separate tables (Customers, Products, Orders, Sales Representatives, and Order Items), each entity is stored once, eliminating redundancy. This improves data consistency, simplifies updates, prevents unintended data loss, and ensures the system remains efficient and scalable as the business grows.
## ETL Decisions

### Decision 1 — Standardizing Date Formats

Problem: The raw dataset contained inconsistent date formats (e.g., DD-MM-YYYY, MM/DD/YYYY, and text-based formats like Jan 5, 2024). This made it difficult to aggregate data by time (month/year) and caused errors during loading into the warehouse.
Resolution: All date values were converted into a standardized YYYY-MM-DD format during transformation. Additionally, a separate dim_date table was created with extracted attributes such as day, month, and year to support efficient time-based analysis.

### Decision 2 — Handling NULL and Missing Values

Problem: Several records had NULL or missing values in important fields such as quantity, price, or product category, which could lead to incorrect aggregations or failed inserts due to NOT NULL constraints in the warehouse schema.
Resolution: Missing numeric values (e.g., quantity, price) were either filtered out or replaced with default valid values after validation. For categorical fields like product category, missing values were either inferred from similar records or labeled as “Unknown” to maintain data integrity without losing records.

### Decision 3 — Standardizing Category and Text Fields

Problem: The dataset had inconsistent category naming (e.g., “electronics”, “Electronics”, “ELECTRONICS”), which would result in fragmented aggregations and inaccurate reporting.
Resolution: All categorical text fields were cleaned and standardized using consistent casing (e.g., “Electronics”, “Clothing”, “Groceries”). This ensured uniform grouping and accurate results in analytical queries such as revenue by category.
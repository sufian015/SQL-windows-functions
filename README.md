# SQL-windows-functions
This repository contains examples of SQL Window Functions with explanations for real-world analytics.  
## 📖 Examples  

### 1. Aggregate Functions  
Use functions like `SUM`, `AVG`, `COUNT`, `MIN`, and `MAX` for running totals, averages, or summaries within partitions.  

```sql  
SELECT  
    new_id, cata,  
    SUM(new_id) OVER (PARTITION BY cata ORDER BY new_id) AS total,  
    AVG(new_id) OVER (PARTITION BY cata ORDER BY new_id) AS average  
FROM testdata;

2. Range Queries
Analyze data over a specific range of rows using ROWS BETWEEN.


SELECT  
    new_id, cata,  
    SUM(new_id) OVER (PARTITION BY cata ORDER BY new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS total  
FROM testdata;

3. Ranking Functions
Assign ranks or numbers to rows with ROW_NUMBER, RANK, and DENSE_RANK.


SELECT  
    new_id,  
    ROW_NUMBER() OVER (ORDER BY new_id) AS row_number,  
    RANK() OVER (ORDER BY new_id) AS rank  
FROM testdata;

4. Value-Based Functions
Access specific row values using FIRST_VALUE, LAST_VALUE, LEAD, and LAG.


SELECT  
    new_id,  
    FIRST_VALUE(new_id) OVER (ORDER BY new_id) AS first_value,  
    LAST_VALUE(new_id) OVER (ORDER BY new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_value  
FROM testdata;  

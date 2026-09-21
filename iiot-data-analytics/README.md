# IIOT Data Analytics

Ye chhota SQL project compliance tracking ke liye banaya gaya hai. Isme DDL ka use karke database aur related tables create kiye gaye hain.

## Files

- `01_create_database.sql` - `compliance_sample` database create karta hai
- `02_create_tables.sql` - organizations, departments, employees, policies aur compliance checks tables create karta hai
- `03_insert_sample_data.sql` - sample records insert karta hai
- `04_queries.sql` - tables ko dekhne aur report generate karne ke liye SELECT queries

## Run in MySQL / MariaDB

```sql
SOURCE 01_create_database.sql;
SOURCE 02_create_tables.sql;
SOURCE 03_insert_sample_data.sql;
SOURCE 04_queries.sql;
```

## Table data dekhne ka example

```sql
USE compliance_sample;
SELECT * FROM employees;
```
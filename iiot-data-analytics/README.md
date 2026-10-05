# IIOT Data Analytics

Ye chhota SQL project compliance tracking ke liye banaya gaya hai. Isme DDL ka use karke database aur related tables create kiye gaye hain.

## Files

- `01_create_database.sql` - `compliance_sample` database create karta hai
- `02_create_tables.sql` - organizations, departments, employees, policies aur compliance checks tables create karta hai
- `03_insert_sample_data.sql` - sample records insert karta hai
- `04_queries.sql` - tables ko dekhne aur report generate karne ke liye SELECT queries
- `day14.sql` to `day22.sql` - DML, joins, summaries aur subquery practice
- `day23_python_mysql.py` - Python se MySQL data read karna
- `day24_pandas_analysis.py` - Pandas se compliance summary banana
- `requirements.txt` - Python dependencies

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

## Day-wise practice: Days 14-24

Pehle upar diye gaye setup scripts ko isi order mein run karein. Uske baad har din ki SQL file ko MySQL Workbench ya MySQL command line mein alag se run karein:

| Day | Topic | File |
|---:|---|---|
| 14 | `INSERT ... SELECT` aur duplicate se bachav | `day14.sql` |
| 15 | Transaction ke saath `UPDATE` | `day15.sql` |
| 16 | Transaction ke saath `DELETE` | `day16.sql` |
| 17 | Employee-department `INNER JOIN` | `day17.sql` |
| 18 | `LEFT JOIN` se records aur counts | `day18.sql` |
| 19 | Compliance checks ka multi-table join | `day19.sql` |
| 20 | `GROUP BY`, `HAVING` aur status summary | `day20.sql` |
| 21 | `EXISTS` / `NOT EXISTS` subqueries | `day21.sql` |
| 22 | Transaction ke saath multi-table `UPDATE JOIN` | `day22.sql` |
| 23 | Python connector se SQL query chalana | `day23_python_mysql.py` |
| 24 | Pandas aggregation aur CSV export | `day24_pandas_analysis.py` |

Days 15, 16 aur 22 ke DML examples jaan-boojhkar `ROLLBACK` karte hain, isliye practice se sample data persistently change nahi hota. Changes ko rakhne ke liye pehle example samjhein, phir us script mein `ROLLBACK` ko `COMMIT` se badlein.

### Days 23-24 setup

Python ko MySQL Workbench application se connect nahi karna hota. Workbench aur Python dono MySQL server se connect karte hain; Python ke liye server chalna chahiye aur wahi host, port, username aur password use honge jo Workbench connection mein hain.

```powershell
python -m pip install -r requirements.txt
$env:DB_HOST = "localhost"
$env:DB_PORT = "3306"
$env:DB_USER = "your_mysql_user"
$env:DB_PASSWORD = "your_mysql_password"
python day23_python_mysql.py
python day24_pandas_analysis.py
```

`DB_NAME` optional hai; default `compliance_sample` hai. Password ko source files mein na likhein. Day 24 `output/compliance_summary.csv` banata hai.
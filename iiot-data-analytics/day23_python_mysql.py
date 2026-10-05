import os

import mysql.connector
import pandas as pd


def main():
    connection = mysql.connector.connect(
        host=os.getenv("DB_HOST", "localhost"),
        port=int(os.getenv("DB_PORT", "3306")),
        user=os.getenv("DB_USER", "root"),
        password=os.getenv("DB_PASSWORD", ""),
        database=os.getenv("DB_NAME", "compliance_sample"),
    )

    try:
        cursor = connection.cursor(dictionary=True)
        cursor.execute(
            """
            SELECT cc.check_id, e.first_name, e.last_name,
                   p.policy_name, cc.compliance_status, cc.check_date
            FROM compliance_checks cc
            JOIN employees e ON e.employee_id = cc.employee_id
            JOIN policies p ON p.policy_id = cc.policy_id
            ORDER BY cc.check_date, cc.check_id
            """
        )
        checks = pd.DataFrame(cursor.fetchall())
        print(checks.to_string(index=False))
        cursor.close()
    finally:
        connection.close()


if __name__ == "__main__":
    main()
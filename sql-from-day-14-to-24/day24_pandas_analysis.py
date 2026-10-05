import os
from pathlib import Path

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
            SELECT cc.check_id, p.policy_name, cc.compliance_status,
                   cc.check_date
            FROM compliance_checks cc
            JOIN policies p ON p.policy_id = cc.policy_id
            ORDER BY cc.check_date
            """
        )
        checks = pd.DataFrame(cursor.fetchall())
        if checks.empty:
            print("No compliance checks found.")
            return

        summary = (
            checks.assign(is_pass=checks["compliance_status"].eq("Pass"))
            .groupby("policy_name", as_index=False)
            .agg(
                total_checks=("check_id", "count"),
                passed_checks=("is_pass", "sum"),
            )
        )
        summary["pass_rate_pct"] = (
            summary["passed_checks"] / summary["total_checks"] * 100
        ).round(1)
        summary = summary.sort_values("policy_name")

        output_path = Path(__file__).resolve().parent / "output" / "compliance_summary.csv"
        output_path.parent.mkdir(parents=True, exist_ok=True)
        summary.to_csv(output_path, index=False)
        print(summary.to_string(index=False))
        print(f"Saved summary to {output_path}")
        cursor.close()
    finally:
        connection.close()


if __name__ == "__main__":
    main()
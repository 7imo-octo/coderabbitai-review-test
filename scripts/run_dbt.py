import subprocess
import sqlite3

def run_dbt():
    """Run DBT models."""
    result = subprocess.run(["dbt", "run"], capture_output=True, text=True)
    print("DBT Output:", result.stdout)
    if result.returncode != 0:
        raise Exception(f"DBT Run failed: {result.stderr}")

def fetch_results():
    """Fetch results from the SQLite database."""
    conn = sqlite3.connect('../data/database.db')
    cursor = conn.cursor()

    # Fetch the result from the DBT model
    cursor.execute("SELECT * FROM my_model")  # The DBT model creates a view `my_model`
    rows = cursor.fetchall()

    print("DBT Model Results:")
    for row in rows:
        print(row)

    conn.close()

if __name__ == "__main__":
    # Step 1: Run DBT transformations
    print("Running DBT...")
    run_dbt()

    # Step 2: Fetch the transformed results
    print("Fetching results from DBT model...")
    fetch_results()

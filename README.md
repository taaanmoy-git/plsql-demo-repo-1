# Customer PostgreSQL Demo

A small PostgreSQL project demonstrating table creation, sample data, database functions, and common queries.

## Requirements

- PostgreSQL 12 or later
- `psql`
- A database role with permission to create tables, schemas, and functions

## Project layout

```text
.
|-- install.sql
|-- runscript.sh
|-- sql/
|   |-- 01_schema.sql
|   |-- 02_seed_data.sql
|   |-- 03_customer_api.sql
|   `-- 04_queries.sql
`-- README.md
```

## Install: Two Ways

Both options connect to the local PostgreSQL server as `postgres` and run `install.sql`. Enter the PostgreSQL password when prompted.

### Option 1: PowerShell

Run this from the project directory:

```powershell
PS D:\All Project Repository\VS Code\PLSQL-Demo-repo>
& "C:\Program Files\PostgreSQL\18\bin\psql.exe" -h localhost -U postgres -d postgres -f install.sql
```

### Option 2: Linux or Git Bash

From the project directory, run the included shell script. On Linux, make it executable once if needed:

```bash
  or ls  then .\runscript.sh
```

Alternatively, run `bash runscript.sh` without changing its executable permission. On Linux, `psql` must be installed and available on `PATH`.

The installer creates the `infosys` schema, creates `infosys.customer`, inserts five sample rows, and creates the API functions in `infosys`. It is intended for a fresh database; do not rerun it after the table has been created, because the schema script will report that the table already exists.

To run the example queries after installation:

```powershell
& "C:\Program Files\PostgreSQL\18\bin\psql.exe" -h localhost -U postgres -d postgres -f sql/04_queries.sql
```

To use another database or role, replace `postgres` in the commands with the desired database or role name.

## PostgreSQL API

`infosys.add_customer` inserts a customer, and `infosys.customer_count` returns the number of rows. For example:

```sql
SELECT infosys.add_customer(
    p_first_name => 'Alex',
    p_last_name  => 'Morgan',
    p_email      => 'alex.morgan@example.com',
    p_city       => 'Seattle'
);

SELECT infosys.customer_count() AS customer_count;
```

The unique email constraint rejects duplicate email addresses. `psql` commits each successful statement automatically unless you start an explicit transaction.

## Publish to GitHub

Initialize the local repository if it is not already initialized, then create an empty repository on GitHub and connect it:

```powershell
git init
git add .
git status
git commit -m "Add customer PostgreSQL demo"
git checkout -b main
git branch -M main
git remote add origin https://github.com/YOUR-USERNAME/YOUR-REPOSITORY.git
git remote -v
git push -u origin main
or
git push --set-upstream origin main
```

  git config --global user.email "taaanmoy.saha@gmail.com"
  git config --global user.name "taaanmoy-git"

 git push --set-upstream origin main

Replace the remote URL with the URL of your GitHub repository. GitHub authentication must be configured on your machine before pushing.
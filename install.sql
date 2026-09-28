\set ON_ERROR_STOP on

\echo Creating customer table...
\ir sql/01_schema.sql

\echo Inserting sample customers...
\ir sql/02_seed_data.sql

\echo Creating customer API functions...
\ir sql/03_customer_api.sql

\echo Installation complete. Run psql -f sql/04_queries.sql to view the examples.
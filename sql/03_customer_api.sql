CREATE OR REPLACE FUNCTION infosys.add_customer (
    p_first_name VARCHAR,
    p_last_name  VARCHAR,
    p_email      VARCHAR,
    p_city       VARCHAR,
    p_phone      VARCHAR DEFAULT NULL
)
RETURNS VOID
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO infosys.customer (first_name, last_name, email, city, phone)
    VALUES (p_first_name, p_last_name, p_email, p_city, p_phone);
END;
$$;

CREATE OR REPLACE FUNCTION infosys.customer_count()
RETURNS BIGINT
LANGUAGE SQL
AS $$
    SELECT COUNT(*) FROM infosys.customer;
$$;

-- 
-- Hasura user - Note only select granted on tables - i.e. read-only
-- 


-- We will create a separate user and grant permissions on hasura-specific
-- schemas and information_schema and pg_catalog
-- These permissions/grants are required for Hasura to work properly.

-- create a separate user for hasura
CREATE USER hasurauser WITH PASSWORD 'hasurauser';

-- create pgcrypto extension, required for UUID
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- create the schemas required by the hasura system
-- NOTE: If you are starting from scratch: drop the below schemas first, if they exist.
CREATE SCHEMA IF NOT EXISTS hdb_catalog;
CREATE SCHEMA IF NOT EXISTS hdb_views;

-- make the user an owner of system schemas
ALTER SCHEMA hdb_catalog OWNER TO hasurauser;
ALTER SCHEMA hdb_views OWNER TO hasurauser;

-- grant select permissions on information_schema and pg_catalog. This is
-- required for hasura to query list of available tables
GRANT SELECT ON ALL TABLES IN SCHEMA information_schema TO hasurauser;
GRANT SELECT ON ALL TABLES IN SCHEMA pg_catalog TO hasurauser;

-- Below permissions are optional. This is dependent on what access to your
-- tables/schemas - you want give to hasura. If you want expose the public
-- schema for GraphQL query then give permissions on public schema to the
-- hasura user.
-- Be careful to use these in your production db. Consult the postgres manual or
-- your DBA and give appropriate permissions.

-- grant all privileges on all tables in the public schema. This can be customised:
-- For example, if you only want to use GraphQL regular queries and not mutations,
-- then you can set: GRANT SELECT ON ALL TABLES...


REVOKE ALL ON SCHEMA public FROM hasurauser;

REVOKE CREATE ON SCHEMA public FROM PUBLIC;
REVOKE CREATE ON SCHEMA public FROM hasurauser;

GRANT SELECT ON ALL TABLES IN SCHEMA public TO hasurauser;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA public TO hasurauser;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO hasurauser;

-- 
-- Prevent Hasura from adding additional tables or triggers
-- Make sure run ALTER DEFAULT as hasurauser

ALTER DEFAULT PRIVILEGES FOR ROLE hasurauser REVOKE ALL PRIVILEGES ON TABLES FROM PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE hasurauser REVOKE ALL PRIVILEGES ON SEQUENCES FROM PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE hasurauser REVOKE ALL PRIVILEGES ON FUNCTIONS FROM PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE hasurauser REVOKE ALL PRIVILEGES ON ROUTINES FROM PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE hasurauser REVOKE ALL PRIVILEGES ON TYPES FROM PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE hasurauser REVOKE ALL PRIVILEGES ON SCHEMAS FROM PUBLIC;

ALTER DEFAULT PRIVILEGES FOR ROLE hasurauser REVOKE ALL PRIVILEGES ON TABLES FROM hasurauser;
ALTER DEFAULT PRIVILEGES FOR ROLE hasurauser REVOKE ALL PRIVILEGES ON SEQUENCES FROM hasurauser;
ALTER DEFAULT PRIVILEGES FOR ROLE hasurauser REVOKE ALL PRIVILEGES ON FUNCTIONS FROM hasurauser;
ALTER DEFAULT PRIVILEGES FOR ROLE hasurauser REVOKE ALL PRIVILEGES ON ROUTINES FROM hasurauser;
ALTER DEFAULT PRIVILEGES FOR ROLE hasurauser REVOKE ALL PRIVILEGES ON TYPES FROM hasurauser;
ALTER DEFAULT PRIVILEGES FOR ROLE hasurauser REVOKE ALL PRIVILEGES ON SCHEMAS FROM hasurauser;

-- Similarly add this for other schemas, if you have any.
-- GRANT USAGE ON SCHEMA <schema-name> TO hasurauser;
-- GRANT ALL ON ALL TABLES IN SCHEMA <schema-name> TO hasurauser;
-- GRANT ALL ON ALL SEQUENCES IN SCHEMA <schema-name> TO hasurauser;










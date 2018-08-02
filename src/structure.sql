BEGIN;

CREATE SCHEMA IF NOT EXISTS csv;

CREATE TABLE IF NOT EXISTS csv.data (
    provider TEXT,
    category TEXT,
    url TEXT,
    status TEXT,
    blocked TEXT
);

CREATE TABLE IF NOT EXISTS csv.blacklist (
    category TEXT,
    domains TEXT,
    urls TEXT
);

CREATE TABLE IF NOT EXISTS provider (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS category (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS url (
    id SERIAL PRIMARY KEY,
    provider_id INTEGER REFERENCES provider(id),
    category_id INTEGER REFERENCES category(id),
    url TEXT NOT NULL,
    status INTEGER,
    blocked BOOL NOT NULL
);

COMMIT;

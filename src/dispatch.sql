BEGIN;

WITH csv_provider AS (
    SELECT DISTINCT provider AS name
        FROM csv.data
)
INSERT INTO provider (name)
    SELECT csv.name
    FROM csv_provider AS csv
    WHERE NOT EXISTS (
        SELECT name
            FROM provider
            WHERE provider.name = csv.name
    );

WITH csv_category AS (
    SELECT DISTINCT category AS name
        FROM csv.data
)
INSERT INTO category (name)
    SELECT csv.name
    FROM csv_category AS csv
    WHERE NOT EXISTS (
        SELECT name
            FROM category
            WHERE category.name = csv.name
    );

WITH csv_url AS (
    SELECT DISTINCT *
        FROM csv.data
)
INSERT INTO url (provider_id, category_id, url, status, blocked)
    SELECT provider.id, category.id, csv.url, csv.status::integer, blocked::bool
    FROM csv_url AS csv
        JOIN provider ON csv.provider = provider.name
        JOIN category ON csv.category = category.name
    WHERE NOT EXISTS (
        SELECT url
            FROM url
            JOIN provider ON provider.id = url.provider_id
            JOIN category ON category.id = url.category_id
            WHERE url.url = csv.url
                AND provider.name = csv.provider
                AND category.name = csv.category
    );

COMMIT;

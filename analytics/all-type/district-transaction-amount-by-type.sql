-- 유형별로 합치기 (컬럼: district, transaction_amount, type)
CREATE OR REPLACE TABLE myzip.analytics.all_type_district_si_do_amount AS
SELECT
    SPLIT_PART(district, ' ', 1) AS city,
    transaction_amount,
    'Apartment' AS "TYPE"
FROM apartment

UNION ALL

SELECT
    SPLIT_PART(district, ' ', 1) AS city,
    transaction_amount,
    'Mansion' AS "TYPE"
FROM mansion

UNION ALL

SELECT
    SPLIT_PART(district, ' ', 1) AS city,
    transaction_amount,
    'Multiplex House' AS "TYPE"
FROM multplex_house

UNION ALL

SELECT
    SPLIT_PART(district, ' ', 1) AS city,
    transaction_amount,
    'Officetel' AS "TYPE"
FROM officetel;

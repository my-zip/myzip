-- 건축 연도별 평균 가격 확인
CREATE OR REPLACE TABLE myzip.analytics.all_type_construction_year AS
SELECT 
    'Apartment' as type,
    SPLIT_PART(district, ' ', 1) AS city,
    construction_year,
    transaction_amount    
FROM apartment

UNION ALL 

SELECT 
    'Mansion' as type,
    SPLIT_PART(district, ' ', 1) AS city,
    construction_year,
    transaction_amount    
FROM mansion

UNION ALL 

SELECT 
    'Multiplex House' as type,
    SPLIT_PART(district, ' ', 1) AS city,
    construction_year,
    transaction_amount    
FROM multplex_house

UNION ALL 

SELECT 
    'Officetel' as type,
    SPLIT_PART(district, ' ', 1) AS city,
    construction_year,
    transaction_amount    
FROM officetel;

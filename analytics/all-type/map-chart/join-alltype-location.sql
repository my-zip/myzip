-- 모든 건축 유형 테이블과 위치 테이블을 조인
CREATE OR REPLACE TABLE myzip.analytics.total_data_location AS 
SELECT 
    Type, no, 
    district, 
    si_do_gun, 
    latitude, 
    longitude, 
    iso_3166
FROM (
    SELECT 
        '연립/다세대' AS Type,
        no, 
        district
    FROM myzip.raw_data.multplex_house mh
    
    UNION ALL
    
    SELECT 
        '아파트' AS Type,
        no, 
        district
    FROM myzip.raw_data.apartment
    
    UNION ALL
    
    SELECT 
        '오피스텔' AS Type,
        no, 
        district
    FROM myzip.raw_data.officetel
    
    UNION ALL
    
    SELECT 
        '단독/다가구' AS Type,
        no, 
        district
    FROM myzip.raw_data.mansion
    ) AS all_data
JOIN (
    SELECT
        CONCAT(a.si_do, ' ', a.si_gun) AS si_do_gun, 
        latitude, 
        longitude, 
        iso_3166
    FROM (
        SELECT *
        FROM 
            myzip.raw_data.longitude_latitude
        WHERE 
            eup_myeon_dong IS NULL 
            AND eup_myeon_lee_dong IS NULL 
            AND lee IS NULL 
            AND si_gun IS NOT NULL
        ) AS a
    ) AS ll
ON all_data.district LIKE CONCAT('%', ll.si_do_gun, '%')
GROUP BY si_do_gun;

-- 광역시만 포함한 테이블
CREATE OR REPLACE TABLE myzip.analytics.metropolitan_apt AS
SELECT *,
CASE WHEN district LIKE '%부산%' THEN '부산'
     WHEN district LIKE '%대구%' THEN '대구'
     WHEN district LIKE '%인천%' THEN '인천'
     WHEN district LIKE '%광주%' THEN '광주'
     WHEN district LIKE '%대전%' THEN '대전'
     WHEN district LIKE '%울산%' THEN '울산'
     ELSE NULL
END city
FROM myzip.raw_data.apartment
WHERE city IS NOT NULL;
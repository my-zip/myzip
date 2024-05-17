-- 주요 도시별 오피스텔 데이터
CREATE OR REPLACE TABLE myzip.analytics.maincity_officetel AS
SELECT *,
CASE WHEN district LIKE '%서울%' THEN '서울'
     WHEN district LIKE '%부산%' THEN '부산'
     WHEN district LIKE '%대구%' THEN '대구'
     WHEN district LIKE '%인천%' THEN '인천'
     WHEN district LIKE '%광주%' THEN '광주'
     WHEN district LIKE '%대전%' THEN '대전'
     WHEN district LIKE '%울산%' THEN '울산'
     ELSE NULL
END city
FROM myzip.raw_data.officetel
WHERE city IS NOT NULL;
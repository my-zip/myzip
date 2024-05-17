-- 세부 지역별 위도, 경도 테이블 생성
CREATE OR REPLACE TABLE myzip.raw_data.longitude_latitude (
    si_do VARCHAR(20),
    si_gun VARCHAR(20),
    eup_myeon_dong VARCHAR(20),
    eup_myeon_lee_dong VARCHAR(20),
    lee VARCHAR(20),
    latitude DECIMAL(10,7),
    longitude DECIMAL(10,7)
);

-- 벌크 업데이트
COPY INTO myzip.raw_data.longitude_latitude
FROM 's3://bucket-name/longitude_latitude/longitude_latitude.csv'
credentials=(AWS_KEY_ID='AWS-KEY' AWS_SECRET_KEY='SECRET-KEY')
FILE_FORMAT=(type='CSV' skip_header=1 FIELD_OPTIONALLY_ENCLOSED_BY='"', NULL_IF = ('-'));

-- 시/도 별 ISO3166 컬럼 추가
ALTER TABLE myzip.raw_data.longitude_latitude
ADD COLUMN iso_3166 VARCHAR(10);

UPDATE myzip.raw_data.longitude_latitude
SET iso_3166 = 
    CASE
        WHEN si_do = '서울특별시' THEN 'KR-11'
        WHEN si_do = '부산광역시' THEN 'KR-26'
        WHEN si_do = '대구광역시' THEN 'KR-27'
        WHEN si_do = '인천광역시' THEN 'KR-28'
        WHEN si_do = '광주광역시' THEN 'KR-29'
        WHEN si_do = '대전광역시' THEN 'KR-30'
        WHEN si_do = '울산광역시' THEN 'KR-31'
        WHEN si_do = '경기도' THEN 'KR-41'
        WHEN si_do = '강원특별자치도' THEN 'KR-42'
        WHEN si_do = '충청북도' THEN 'KR-43'
        WHEN si_do = '충청남도' THEN 'KR-44'
        WHEN si_do = '전북특별자치도' THEN 'KR-45'
        WHEN si_do = '전라남도' THEN 'KR-46'
        WHEN si_do = '경상북도' THEN 'KR-47'
        WHEN si_do = '경상남도' THEN 'KR-48'
        WHEN si_do = '제주특별자치도' THEN 'KR-49'
        WHEN si_do = '세종특별자치시 ' THEN 'KR-50'
    END;

-- 연립 / 다세대 테이블과 조인 예시
select *
from myzip.raw_data.multplex_house mh
join
    (select CONCAT(a.si_do, ' ', a.si_gun) AS si_do_gun, latitude, longitude, iso_3166
    from 
        (select *
        from myzip.raw_data.longitude_latitude
        where (eup_myeon_dong IS NULL and eup_myeon_lee_dong IS NULL and lee IS NULL and si_gun IS NOT NULL))
        as a) ll
ON mh.district LIKE CONCAT('%', ll.si_do_gun, '%');

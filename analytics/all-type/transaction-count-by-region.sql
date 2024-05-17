-- 모든 유형의 지역별 거래 수 테이블
CREATE OR REPLACE TABLE myzip.analytics.total_data_location_count AS
select tdl.si_do_gun, count(1) AS Deal 
from myzip.analytics.total_data_location AS tdl
group by tdl.si_do_gun;

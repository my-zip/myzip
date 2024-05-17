-- 모든 유형의 지역별 거래 수 테이블
CREATE OR REPLACE TABLE myzip.analytics.total_data_location_count AS
select tdl.si_do_gun, count(1) AS Deal , ll.latitude, ll.longitude, ll.iso_3166
from myzip.analytics.total_data_location AS tdl
join
    (select CONCAT(a.si_do, ' ', a.si_gun) AS si_do_gun, latitude, longitude, iso_3166
    from 
        (select *
        from myzip.raw_data.longitude_latitude
        where (eup_myeon_dong IS NULL and eup_myeon_lee_dong IS NULL and lee IS NULL and si_gun IS NOT NULL))
        as a) ll
ON tdl.si_do_gun LIKE CONCAT('%', ll.si_do_gun, '%')
group by tdl.si_do_gun;

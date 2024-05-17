-- 지역별 거래 수 테이블과 위치 테이블 조인
CREATE OR REPLACE TABLE myzip.analytics.total_data_location_final AS
select tdlc.si_do_gun, deal, latitude, longitude, iso_3166
from myzip.analytics.total_data_location_count AS tdlc
join 
    (
    select CONCAT(a.si_do, ' ', a.si_gun) AS si_do_gun, latitude, longitude, iso_3166
    from
        (select *
        from myzip.raw_data.longitude_latitude
        where (eup_myeon_dong IS NULL and eup_myeon_lee_dong IS NULL and lee IS NULL and si_gun IS NOT NULL))
        as a) ll
ON tdlc.si_do_gun LIKE CONCAT('%', ll.si_do_gun, '%');

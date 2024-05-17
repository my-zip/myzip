-- 주요 학군지 별 아파트 평균 가격 차이
CREATE OR REPLACE TABLE myzip.analytics.study_area_avg AS
SELECT Area, Study_area, area_avg, study_area_avg
FROM(
    select
        '강남구' AS Area,
        '강남구 대치동' AS Study_area,
        avg(transaction_amount) as area_avg,
        (
            select avg(transaction_amount) 
            from apartment
            where district like '%강남구 대치동%'
        ) as study_area_avg
    from apartment
    where district like '%강남구%'
    

    UNION ALL
    
    select
        '노원구' AS Area,
        '노원구 중계동' AS Study_area,
        avg(transaction_amount) as area_avg,
        (
            select avg(transaction_amount) 
            from apartment
            where district like '%노원구 중계동%'
        ) as study_area_avg
    from apartment
    where district like '%노원구%'
    
    UNION ALL
    
    select
        '성남시' AS Area,
        '성남시 분당구' AS Study_area,
        avg(transaction_amount) as area_avg,
        (
            select avg(transaction_amount) 
            from apartment
            where district like '%성남시분당구%'
        ) as study_area_avg
    from apartment
    where district like '%성남시%'
    
    UNION ALL
    
    select
        '대구광역시' AS Area,
        '대구광역시 수성구' AS Study_area,
        avg(transaction_amount) as area_avg,
        (
            select avg(transaction_amount) 
            from apartment
            where district like '%대구광역시 수성구%'
        ) as study_area_avg
    from apartment
    where district like '%대구%'
    
    UNION ALL
    
    select
        '부산광역시' AS Area,
        '부산광역시 해운대구' AS Study_area,
        avg(transaction_amount) as area_avg,
        (
            select avg(transaction_amount) 
            from apartment
            where district like '%부산광역시 해운대구%'
        ) as study_area_avg
    from apartment
    where district like '%부산%'
    ) as study_areas;
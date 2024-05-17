-- 모든 건축 유형의 주별 거래량 테이블
CREATE OR REPLACE TABLE myzip.analytics.weekly_deal AS
SELECT Type, Week_Start_Date, Deal_Volume
From (
    SELECT 
        '오피스텔' AS Type,
        DATE_TRUNC('week', TO_DATE(CONCAT(Contract_Year_Month, Contract_Day), 'YYYYMMDD')) AS Week_Start_Date,
        COUNT(*) AS Deal_Volume
    FROM myzip.raw_data.officetel
    GROUP BY 2
    
    UNION ALL

    SELECT 
        '단독/다가구' AS Type,
        DATE_TRUNC('week', TO_DATE(CONCAT(Contract_Year_Month, Contract_Day), 'YYYYMMDD')) AS Week_Start_Date,
        COUNT(*) AS Deal_Volume
    FROM myzip.raw_data.mansion
    GROUP BY 2

    UNION ALL
    
    SELECT 
        '아파트' AS Type,
        DATE_TRUNC('week', TO_DATE(CONCAT(Contract_Year_Month, Contract_Day), 'YYYYMMDD')) AS Week_Start_Date,
        COUNT(*) AS Deal_Volume
    FROM myzip.raw_data.apartment
    GROUP BY 2
    
    UNION ALL
    
    SELECT 
        '연립/다세대' AS Type,
        DATE_TRUNC('week', TO_DATE(CONCAT(Contract_Year_Month, Contract_Day), 'YYYYMMDD')) AS Week_Start_Date,
        COUNT(*) AS Deal_Volume
    FROM myzip.raw_data.multplex_house
    GROUP BY 2
    ) AS weekly_deal_volume
ORDER BY 2,1;

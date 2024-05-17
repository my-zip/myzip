-- 단독 / 다가구 테이블 생성
CREATE TABLE myzip.raw_data.mansion(
    no INT,
    district VARCHAR(255),
    lot_number VARCHAR(255),
    Housing_Type VARCHAR(50),
    Road_Conditions VARCHAR(50),
    Total_Floor_Area DECIMAL(10, 3),
    Land_Area DECIMAL(10, 3),
    Contract_Year_Month VARCHAR(6),
    Contract_Day VARCHAR(2),
    Transaction_Amount BIGINT,
    Buyer VARCHAR(255),
    Seller VARCHAR(255),
    Construction_Year VARCHAR(4),
    Road_Name VARCHAR(255),
    Cancellation_Date DATE,
    Transaction_Type VARCHAR(255),
    Brokerage_Location VARCHAR(255)
);

-- 벌크 업데이트
COPY INTO myzip.raw_data.mansion
FROM 's3://bucket-name/mansion/mansion_yyyy_mm.csv'
credentials=(AWS_KEY_ID='KEY-ID' AWS_SECRET_KEY='SECRET-KEY')
FILE_FORMAT=(type='CSV' skip_header=1 FIELD_OPTIONALLY_ENCLOSED_BY='"', NULL_IF = ('-'));

-- 오피스텔 테이블 생성
CREATE OR REPLACE TABLE myzip.raw_data.officetel (
    NO INT,
    District VARCHAR(255),
    Lot_Number VARCHAR(255),
    Primary_Number VARCHAR(255),
    Secondary_Number VARCHAR(255),
    Complex_Name VARCHAR(255),
    Exclusive_Area DECIMAL(10, 4),
    Contract_Year_Month VARCHAR(6),
    Contract_Day VARCHAR(2),
    Transaction_Amount BIGINT,
    Floor INT,
    Buyer VARCHAR(255),
    Seller VARCHAR(255),
    Construction_Year VARCHAR(4),
    Road_Name VARCHAR(255),
    Cancellation_Date DATE,
    Transaction_Type VARCHAR(255),
    Brokerage_Location VARCHAR(255)
);

-- 벌크 업데이트
COPY INTO myzip.raw_data.officetel
FROM 's3://bucket-name/officetel/officetel_2024_01.csv'
credentials=(AWS_KEY_ID='KEY-ID' AWS_SECRET_KEY='SECRET-KEY')
FILE_FORMAT = (type='CSV' skip_header=1 FIELD_OPTIONALLY_ENCLOSED_BY='"', NULL_IF = ('-'));

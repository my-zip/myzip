-- 아파트 테이블 생성
CREATE OR REPLACE TABLE myzip.raw_data.apartment (
    no INT,
    district VARCHAR(255),
    lot_number VARCHAR(255),
    primary_number VARCHAR(255),
    secondary_number VARCHAR(255),
    complex_name VARCHAR(255),
    exclusive_area DECIMAL(10, 4),
    contract_year_month VARCHAR(6),
    contract_day VARCHAR(2),
    transaction_amount BIGINT,
    building_number VARCHAR(255),
    floor INT,
    buyer VARCHAR(255),
    seller VARCHAR(255),
    construction_year VARCHAR(4),
    road_name VARCHAR(255),
    cancellation_date DATE,
    transaction_type VARCHAR(255),
    brokerage_location VARCHAR(255),
    registration_date VARCHAR(255)
);

-- 벌크 업데이트
COPY INTO myzip.raw_data.apartment
FROM 's3://bucket-name/apartment/apartment_yyyy_mm.csv'
credentials=(AWS_KEY_ID='KEY-ID' AWS_SECRET_KEY='SECRET-KEY')
FILE_FORMAT=(type='CSV' skip_header=1 FIELD_OPTIONALLY_ENCLOSED_BY='"', NULL_IF = ('-'));

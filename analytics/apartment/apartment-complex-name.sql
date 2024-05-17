-- 가장 많이 나온 아파트 이름 WordColud를 위한 테이블
CREATE OR REPLACE TABLE myzip.analytics.apt_name_wordcloud AS
SELECT complex_name, count
FROM(
    SELECT complex_name, count(1) AS COUNT
    FROM myzip.raw_data.apartment
    GROUP BY 1
);
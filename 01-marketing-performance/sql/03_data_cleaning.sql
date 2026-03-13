SELECT
acquisition_cost,
REPLACE(REPLACE(acquisition_cost, '$',''), ',', '') AS cleaned_cost
FROM marketing_campaigns
LIMIT 10;

SELECT
CAST(REPLACE(REPLACE(acquisition_cost, '$',''), ',', '') AS NUMERIC) AS cost_numeric
FROM marketing_campaigns
LIMIT 10;

ALTER TABLE marketing_campaigns
ADD COLUMN acquisition_cost_num NUMERIC;

UPDATE marketing_campaigns
SET acquisition_cost_num =
CAST(REPLACE(REPLACE(acquisition_cost, '$',''), ',', '') AS NUMERIC);

ALTER TABLE marketing_campaigns
ADD COLUMN roi_num NUMERIC;

UPDATE marketing_campaigns
SET roi_num =
CAST(REPLACE(roi, '%','') AS NUMERIC);
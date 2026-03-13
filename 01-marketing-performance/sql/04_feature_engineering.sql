SELECT
AVG(acquisition_cost_num) AS avg_cost,
AVG(roi_num) AS avg_roi,
AVG(conversion_rate) AS avg_conversion
FROM marketing_campaigns;

SELECT
campaign_id,
channel_used,
campaign_type,
acquisition_cost_num,
roi_num,
conversion_rate,

CASE
    WHEN roi_num >= (SELECT AVG(roi_num) FROM marketing_campaigns)
        AND acquisition_cost_num < (SELECT AVG(acquisition_cost_num) FROM marketing_campaigns)
    THEN 'High ROI / Low Cost'

    WHEN roi_num >= (SELECT AVG(roi_num) FROM marketing_campaigns)
        AND acquisition_cost_num >= (SELECT AVG(acquisition_cost_num) FROM marketing_campaigns)
    THEN 'High ROI / High Cost'

    WHEN roi_num < (SELECT AVG(roi_num) FROM marketing_campaigns)
        AND acquisition_cost_num < (SELECT AVG(acquisition_cost_num) FROM marketing_campaigns)
    THEN 'Low ROI / Low Cost'

    ELSE 'Low ROI / High Cost'
END AS efficiency_category

FROM marketing_campaigns;

SELECT
efficiency_category,
COUNT(*) AS campaigns
FROM (

SELECT
CASE
    WHEN roi_num >= (SELECT AVG(roi_num) FROM marketing_campaigns)
        AND acquisition_cost_num < (SELECT AVG(acquisition_cost_num) FROM marketing_campaigns)
    THEN 'High ROI / Low Cost'

    WHEN roi_num >= (SELECT AVG(roi_num) FROM marketing_campaigns)
        AND acquisition_cost_num >= (SELECT AVG(acquisition_cost_num) FROM marketing_campaigns)
    THEN 'High ROI / High Cost'

    WHEN roi_num < (SELECT AVG(roi_num) FROM marketing_campaigns)
        AND acquisition_cost_num < (SELECT AVG(acquisition_cost_num) FROM marketing_campaigns)
    THEN 'Low ROI / Low Cost'

    ELSE 'Low ROI / High Cost'
END AS efficiency_category

FROM marketing_campaigns

) t

GROUP BY efficiency_category
ORDER BY campaigns DESC;

SELECT
channel_used,
efficiency_category,
COUNT(*) AS campaigns
FROM (

SELECT
channel_used,

CASE
    WHEN roi_num >= (SELECT AVG(roi_num) FROM marketing_campaigns)
        AND acquisition_cost_num < (SELECT AVG(acquisition_cost_num) FROM marketing_campaigns)
    THEN 'High ROI / Low Cost'

    WHEN roi_num >= (SELECT AVG(roi_num) FROM marketing_campaigns)
        AND acquisition_cost_num >= (SELECT AVG(acquisition_cost_num) FROM marketing_campaigns)
    THEN 'High ROI / High Cost'

    WHEN roi_num < (SELECT AVG(roi_num) FROM marketing_campaigns)
        AND acquisition_cost_num < (SELECT AVG(acquisition_cost_num) FROM marketing_campaigns)
    THEN 'Low ROI / Low Cost'

    ELSE 'Low ROI / High Cost'
END AS efficiency_category

FROM marketing_campaigns

) t

GROUP BY channel_used, efficiency_category
ORDER BY channel_used;

SELECT column_name
FROM information_schema.columns
WHERE table_name = 'marketing_campaigns';

ALTER TABLE marketing_campaigns
ADD COLUMN duration_days INTEGER;

UPDATE marketing_campaigns
SET duration_days =
CAST(REPLACE(duration, ' days', '') AS INTEGER);

SELECT
duration,
duration_days
FROM marketing_campaigns
LIMIT 10;

ALTER TABLE marketing_campaigns
ADD COLUMN estimated_conversions NUMERIC;

UPDATE marketing_campaigns
SET estimated_conversions = clicks * conversion_rate;
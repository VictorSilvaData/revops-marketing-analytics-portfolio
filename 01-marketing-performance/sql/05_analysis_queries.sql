SELECT
channel_used,
COUNT(*) AS campaigns,
SUM(clicks) AS total_clicks,
SUM(impressions) AS total_impressions,
AVG(conversion_rate) AS avg_conversion_rate,
AVG(roi_num) AS avg_roi
FROM marketing_campaigns
GROUP BY channel_used
ORDER BY avg_roi DESC;

SELECT
channel_used,
SUM(clicks) AS total_clicks,
SUM(impressions) AS total_impressions,
SUM(clicks) * 1.0 / SUM(impressions) AS ctr
FROM marketing_campaigns
GROUP BY channel_used
ORDER BY ctr DESC;

SELECT
channel_used,
AVG(acquisition_cost_num) AS avg_acquisition_cost,
AVG(roi_num) AS avg_roi
FROM marketing_campaigns
GROUP BY channel_used
ORDER BY avg_roi DESC;

SELECT
channel_used,
AVG(acquisition_cost_num) AS avg_acquisition_cost,
AVG(roi_num) AS avg_roi
FROM marketing_campaigns
GROUP BY channel_used
ORDER BY avg_roi DESC;

SELECT
campaign_type,
COUNT(*) AS campaigns,
AVG(conversion_rate) AS avg_conversion_rate,
AVG(roi_num) AS avg_roi,
AVG(engagement_score) AS avg_engagement
FROM marketing_campaigns
GROUP BY campaign_type
ORDER BY avg_roi DESC;

SELECT
engagement_score,
AVG(conversion_rate) AS avg_conversion_rate
FROM marketing_campaigns
GROUP BY engagement_score
ORDER BY engagement_score;

SELECT
campaign_id,
company,
channel_used,
roi_num,
acquisition_cost_num
FROM marketing_campaigns
ORDER BY roi_num DESC
LIMIT 10;

SELECT DISTINCT customer_segment
FROM marketing_campaigns;

SELECT
customer_segment,
COUNT(*) AS campaigns,
AVG(conversion_rate) AS avg_conversion_rate,
AVG(roi_num) AS avg_roi,
AVG(acquisition_cost_num) AS avg_acquisition_cost,
AVG(engagement_score) AS avg_engagement
FROM marketing_campaigns
GROUP BY customer_segment
ORDER BY avg_roi DESC;

SELECT
customer_segment,
SUM(clicks) AS total_clicks,
SUM(impressions) AS total_impressions,
SUM(clicks) * 1.0 / SUM(impressions) AS ctr
FROM marketing_campaigns
GROUP BY customer_segment
ORDER BY ctr DESC;

SELECT
customer_segment,
channel_used,
AVG(roi_num) AS avg_roi
FROM marketing_campaigns
GROUP BY customer_segment, channel_used
ORDER BY customer_segment, avg_roi DESC;

SELECT DISTINCT campaign_type
FROM marketing_campaigns
ORDER BY campaign_type;

SELECT
campaign_type,
COUNT(*) AS campaigns,
AVG(conversion_rate) AS avg_conversion_rate,
AVG(roi_num) AS avg_roi,
AVG(acquisition_cost_num) AS avg_acquisition_cost,
AVG(engagement_score) AS avg_engagement
FROM marketing_campaigns
GROUP BY campaign_type
ORDER BY avg_roi DESC;

SELECT
campaign_type,
SUM(clicks) AS total_clicks,
SUM(impressions) AS total_impressions,
SUM(clicks) * 1.0 / SUM(impressions) AS ctr
FROM marketing_campaigns
GROUP BY campaign_type
ORDER BY ctr DESC;

SELECT
campaign_type,
AVG(acquisition_cost_num) AS avg_cost,
AVG(roi_num) AS avg_roi
FROM marketing_campaigns
GROUP BY campaign_type
ORDER BY avg_roi DESC;

SELECT
campaign_type,
channel_used,
AVG(roi_num) AS avg_roi
FROM marketing_campaigns
GROUP BY campaign_type, channel_used
ORDER BY campaign_type, avg_roi DESC;

SELECT DISTINCT location
FROM marketing_campaigns
ORDER BY location;

SELECT
location,
COUNT(*) AS campaigns,
AVG(conversion_rate) AS avg_conversion_rate,
AVG(roi_num) AS avg_roi,
AVG(acquisition_cost_num) AS avg_cost,
AVG(engagement_score) AS avg_engagement
FROM marketing_campaigns
GROUP BY location
ORDER BY avg_roi DESC;

SELECT
location,
SUM(clicks) AS total_clicks,
SUM(impressions) AS total_impressions,
SUM(clicks) * 1.0 / SUM(impressions) AS ctr
FROM marketing_campaigns
GROUP BY location
ORDER BY ctr DESC;

SELECT
location,
AVG(acquisition_cost_num) AS avg_cost,
AVG(roi_num) AS avg_roi
FROM marketing_campaigns
GROUP BY location
ORDER BY avg_roi DESC;

SELECT
location,
channel_used,
AVG(roi_num) AS avg_roi
FROM marketing_campaigns
GROUP BY location, channel_used
ORDER BY location, avg_roi DESC;

SELECT
MIN(date) AS start_date,
MAX(date) AS end_date
FROM marketing_campaigns;

SELECT
DATE_TRUNC('month', date) AS month,
COUNT(*) AS campaigns,
AVG(conversion_rate) AS avg_conversion_rate,
AVG(roi_num) AS avg_roi,
AVG(acquisition_cost_num) AS avg_cost
FROM marketing_campaigns
GROUP BY month
ORDER BY month;

SELECT
DATE_TRUNC('month', date) AS month,
SUM(clicks) AS total_clicks,
SUM(impressions) AS total_impressions,
SUM(clicks) * 1.0 / SUM(impressions) AS ctr
FROM marketing_campaigns
GROUP BY month
ORDER BY month;

SELECT
DATE_TRUNC('month', date) AS month,
channel_used,
AVG(roi_num) AS avg_roi
FROM marketing_campaigns
GROUP BY month, channel_used
ORDER BY month;

SELECT
DATE_TRUNC('month', date) AS month,
campaign_type,
AVG(conversion_rate) AS avg_conversion_rate
FROM marketing_campaigns
GROUP BY month, campaign_type
ORDER BY month;

SELECT
channel_used,
SUM(acquisition_cost_num) AS total_spend,
AVG(roi_num) AS avg_roi,
COUNT(*) AS campaigns
FROM marketing_campaigns
GROUP BY channel_used
ORDER BY total_spend DESC;

SELECT
channel_used,
SUM(acquisition_cost_num) AS total_spend,
SUM(acquisition_cost_num * roi_num) / SUM(acquisition_cost_num) AS weighted_roi
FROM marketing_campaigns
GROUP BY channel_used
ORDER BY weighted_roi DESC;

SELECT
channel_used,
SUM(acquisition_cost_num) AS total_spend,
AVG(roi_num) AS avg_roi
FROM marketing_campaigns
GROUP BY channel_used
HAVING AVG(roi_num) > (
    SELECT AVG(roi_num)
    FROM marketing_campaigns
)
ORDER BY avg_roi DESC;

SELECT
channel_used,
AVG(roi_num) AS avg_roi
FROM marketing_campaigns
GROUP BY channel_used
HAVING AVG(roi_num) < (
    SELECT AVG(roi_num)
    FROM marketing_campaigns
);

SELECT
campaign_id,
clicks,
conversion_rate,
(clicks * conversion_rate) AS estimated_conversions
FROM marketing_campaigns
LIMIT 10;

SELECT
SUM(acquisition_cost_num) / SUM(estimated_conversions) AS cac
FROM marketing_campaigns;

SELECT
channel_used,
SUM(acquisition_cost_num) / SUM(estimated_conversions) AS cac
FROM marketing_campaigns
GROUP BY channel_used
ORDER BY cac;

SELECT
AVG(roi_num) AS overall_marketing_roi
FROM marketing_campaigns;

SELECT
AVG(conversion_rate) AS overall_conversion_rate
FROM marketing_campaigns;
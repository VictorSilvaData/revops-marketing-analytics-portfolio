CREATE VIEW channel_performance AS
SELECT
channel_used,
COUNT(*) AS campaigns,
SUM(clicks) AS total_clicks,
SUM(impressions) AS total_impressions,
SUM(clicks) * 1.0 / SUM(impressions) AS ctr,
AVG(conversion_rate) AS avg_conversion_rate,
AVG(roi_num) AS avg_roi,
AVG(acquisition_cost_num) AS avg_acquisition_cost
FROM marketing_campaigns
GROUP BY channel_used;

CREATE VIEW marketing_efficiency_matrix AS

SELECT
campaign_id,
channel_used,
campaign_type,
acquisition_cost_num,
roi_num,
conversion_rate
FROM marketing_campaigns;

CREATE VIEW segment_performance AS
SELECT
customer_segment,
COUNT(*) AS campaigns,
AVG(conversion_rate) AS avg_conversion_rate,
AVG(roi_num) AS avg_roi,
AVG(acquisition_cost_num) AS avg_cost,
AVG(engagement_score) AS avg_engagement
FROM marketing_campaigns
GROUP BY customer_segment;

CREATE VIEW campaign_type_performance AS
SELECT
campaign_type,
COUNT(*) AS campaigns,
AVG(conversion_rate) AS avg_conversion_rate,
AVG(roi_num) AS avg_roi,
AVG(acquisition_cost_num) AS avg_cost,
AVG(engagement_score) AS avg_engagement,
SUM(clicks) AS total_clicks,
SUM(impressions) AS total_impressions
FROM marketing_campaigns
GROUP BY campaign_type;

CREATE VIEW location_performance AS
SELECT
location,
COUNT(*) AS campaigns,
AVG(conversion_rate) AS avg_conversion_rate,
AVG(roi_num) AS avg_roi,
AVG(acquisition_cost_num) AS avg_cost,
AVG(engagement_score) AS avg_engagement,
SUM(clicks) AS total_clicks,
SUM(impressions) AS total_impressions
FROM marketing_campaigns
GROUP BY location;

CREATE VIEW monthly_marketing_trends AS
SELECT
DATE_TRUNC('month', date) AS month,
COUNT(*) AS campaigns,
AVG(conversion_rate) AS avg_conversion_rate,
AVG(roi_num) AS avg_roi,
AVG(acquisition_cost_num) AS avg_cost,
SUM(clicks) AS total_clicks,
SUM(impressions) AS total_impressions,
SUM(clicks) * 1.0 / SUM(impressions) AS ctr
FROM marketing_campaigns
GROUP BY month
ORDER BY month;

CREATE VIEW marketing_campaigns_analytics AS
SELECT
campaign_id,
date,
company,
channel_used,
campaign_type,
customer_segment,
location,
language,

clicks,
impressions,

(clicks * 1.0 / impressions) AS ctr,

conversion_rate,
engagement_score,

acquisition_cost_num,
roi_num,

duration_days

FROM marketing_campaigns;

CREATE VIEW marketing_kpis AS
SELECT
COUNT(*) AS total_campaigns,
SUM(clicks) AS total_clicks,
SUM(impressions) AS total_impressions,
SUM(clicks) * 1.0 / SUM(impressions) AS overall_ctr,
AVG(conversion_rate) AS avg_conversion_rate,
AVG(roi_num) AS avg_roi,
AVG(acquisition_cost_num) AS avg_acquisition_cost
FROM marketing_campaigns;

CREATE VIEW marketing_channel_summary AS
SELECT
channel_used,
COUNT(*) AS campaigns,
SUM(clicks) AS total_clicks,
SUM(impressions) AS total_impressions,
SUM(clicks) * 1.0 / SUM(impressions) AS ctr,
AVG(conversion_rate) AS avg_conversion_rate,
AVG(roi_num) AS avg_roi,
AVG(acquisition_cost_num) AS avg_cost
FROM marketing_campaigns
GROUP BY channel_used;

CREATE VIEW marketing_segment_summary AS
SELECT
customer_segment,
COUNT(*) AS campaigns,
AVG(conversion_rate) AS avg_conversion_rate,
AVG(roi_num) AS avg_roi,
AVG(acquisition_cost_num) AS avg_cost,
AVG(engagement_score) AS avg_engagement
FROM marketing_campaigns
GROUP BY customer_segment;

CREATE VIEW marketing_location_summary AS
SELECT
location,
COUNT(*) AS campaigns,
AVG(conversion_rate) AS avg_conversion_rate,
AVG(roi_num) AS avg_roi,
AVG(acquisition_cost_num) AS avg_cost
FROM marketing_campaigns
GROUP BY location;

CREATE VIEW marketing_monthly_summary AS
SELECT
DATE_TRUNC('month', date) AS month,
COUNT(*) AS campaigns,
AVG(conversion_rate) AS avg_conversion_rate,
AVG(roi_num) AS avg_roi,
AVG(acquisition_cost_num) AS avg_cost,
SUM(clicks) AS total_clicks,
SUM(impressions) AS total_impressions,
SUM(clicks) * 1.0 / SUM(impressions) AS ctr
FROM marketing_campaigns
GROUP BY month
ORDER BY month;

CREATE VIEW marketing_campaigns_analytics AS
SELECT
campaign_id,
date,
company,
channel_used,
campaign_type,
customer_segment,
location,
language,
clicks,
impressions,
(clicks * 1.0 / impressions) AS ctr,
conversion_rate,
engagement_score,
acquisition_cost_num,
roi_num,
duration_days
FROM marketing_campaigns;

CREATE VIEW marketing_budget_efficiency AS
SELECT
channel_used,
SUM(acquisition_cost_num) AS total_spend,
AVG(roi_num) AS avg_roi,
SUM(clicks) AS total_clicks,
SUM(impressions) AS total_impressions,
SUM(clicks) * 1.0 / SUM(impressions) AS ctr
FROM marketing_campaigns
GROUP BY channel_used
ORDER BY avg_roi DESC;

CREATE VIEW marketing_executive_kpis AS
SELECT
SUM(acquisition_cost_num) AS total_marketing_spend,
SUM(clicks) AS total_clicks,
SUM(impressions) AS total_impressions,
SUM(estimated_conversions) AS total_conversions,
SUM(acquisition_cost_num) / SUM(estimated_conversions) AS cac,
AVG(conversion_rate) AS avg_conversion_rate,
AVG(roi_num) AS avg_roi
FROM marketing_campaigns;
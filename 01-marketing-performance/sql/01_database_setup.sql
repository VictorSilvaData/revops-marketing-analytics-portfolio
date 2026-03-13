CREATE TABLE marketing_campaigns (
    campaign_id INTEGER,
    company TEXT,
    campaign_type TEXT,
    target_audience TEXT,
    duration TEXT,
    channel_used TEXT,
    conversion_rate NUMERIC,
    acquisition_cost TEXT,
    roi TEXT,
    location TEXT,
    language TEXT,
    clicks INTEGER,
    impressions INTEGER,
    engagement_score NUMERIC,
    customer_segment TEXT,
    date DATE
);
#dataset imported via PgAmin4 interface, delimeter ',' csv header
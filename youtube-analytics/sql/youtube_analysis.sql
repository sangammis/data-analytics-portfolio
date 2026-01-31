# Overall Channel Performance
SELECT 
    COUNT(*) AS total_videos,
    SUM(views) AS total_views,
    SUM(subscribers_gained) AS total_subscribers
FROM youtube_videos;


# Engagement Rate per Video
SELECT 
    title,
    ROUND((likes + comments) * 100.0 / views, 2) AS engagement_rate
FROM youtube_videos
ORDER BY engagement_rate DESC
LIMIT 5;

# Best Performing Categories
SELECT 
    category,
    COUNT(*) AS videos,
    SUM(views) AS total_views,
    ROUND(AVG(subscribers_gained), 0) AS avg_subscribers
FROM youtube_videos
GROUP BY category
ORDER BY total_views DESC;


# Best Day to Publish
SELECT 
    publish_day,
    ROUND(AVG(views), 0) AS avg_views
FROM youtube_videos
GROUP BY publish_day
ORDER BY avg_views DESC;


# Subscriber Conversion Efficiency
SELECT 
    title,
    ROUND(subscribers_gained * 1000.0 / views, 2) AS subs_per_1000_views
FROM youtube_videos
ORDER BY subs_per_1000_views DESC
LIMIT 5;

# Watch Time Efficiency
SELECT 
    title,
    ROUND(watch_time_minutes * 1.0 / views, 2) AS avg_watch_time
FROM youtube_videos
ORDER BY avg_watch_time DESC
LIMIT 5;

# High Growth Videos (Views + Subs)
SELECT 
    title,
    views,
    subscribers_gained
FROM youtube_videos
WHERE views > 80000
ORDER BY subscribers_gained DESC;


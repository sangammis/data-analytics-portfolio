# Matches Per Season
SELECT season, COUNT(*) AS matches_played
FROM matches
GROUP BY season
ORDER BY season;


# Toss Impact on Match Result
SELECT 
    ROUND(
        SUM(CASE WHEN toss_winner = winner THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS toss_win_percentage
FROM matches;

# Most Successful Teams (Top Winners)
SELECT winner, COUNT(*) AS wins
FROM matches
GROUP BY winner
ORDER BY wins DESC
LIMIT 5;


# Wins While Chasing vs Defending
SELECT toss_decision,
       COUNT(*) AS matches,
       SUM(CASE WHEN winner = team2 THEN 1 ELSE 0 END) AS chasing_wins
FROM matches
GROUP BY toss_decision;

# Top Run Scorers (Best Batsmen)
SELECT batsman, SUM(batsman_runs) AS total_runs
FROM deliveries
GROUP BY batsman
ORDER BY total_runs DESC
LIMIT 10;

# Most Six-Hitting Players
SELECT batsman, COUNT(*) AS sixes
FROM deliveries
WHERE batsman_runs = 6
GROUP BY batsman
ORDER BY sixes DESC
LIMIT 5;

# Best Economy Bowlers
SELECT bowler,
       ROUND(SUM(total_runs) / COUNT(ball), 2) AS economy_rate
FROM deliveries
GROUP BY bowler
ORDER BY economy_rate ASC
LIMIT 10;

# Venue Match Count (Popular Stadiums)
SELECT venue, COUNT(*) AS matches
FROM matches
GROUP BY venue
ORDER BY matches DESC;

# Most Valuable Players (Runs Contribution)
SELECT batting_team, batsman, SUM(batsman_runs) AS runs
FROM deliveries
GROUP BY batting_team, batsman
ORDER BY runs DESC
LIMIT 10;

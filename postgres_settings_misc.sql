--
--  Author: Hari Sekhon
--  Date: 2020-08-06 18:07:25 +0100 (Thu, 06 Aug 2020)
--
--  vim:ts=2:sts=2:sw=2:et:filetype=sql
--
--  https://github.com/HariSekhon/SQL-scripts
--
--  License: see accompanying Hari Sekhon LICENSE file
--
--  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback to help steer this or other code I publish
--
--  https://www.linkedin.com/in/HariSekhon
--

-- Show PostgreSQL misc settings
--
-- eg. Customized Options, Process Title
--
-- Selects the inverse of all adacent postgres_settings_*.sql scripts to find any new / unknown / misc settings
--
-- Requires PostgreSQL 9.5+
--
-- Tested on PostgreSQL 9.5, 9.6, 10.x 11.x, 12.x, 13.0

-- https://www.postgresql.org/docs/12/runtime-config.html

SELECT
  name,
  setting,
  category,
  vartype,
  short_desc,
  enumvals,
  source,
  min_val,
  max_val,
  boot_val,
  reset_val,
  -- not available on PostgreSQL < 9.5
  pending_restart
FROM
  pg_settings
WHERE
  -- inverse of all adjacent postgres_settings_*.sql scripts to check for any other settings
  --
  -- Connections and Authentication / Authentication
  category NOT ILIKE '% / Authentication%'
    AND
  -- Autovacuum
  category NOT ILIKE '%Autovacuum%'
    AND
  -- Client Connection Defaults / Statement Behavior
  -- Client Connection Defaults / Locale and Formatting
  -- Client Connection Defaults / Other Defaults
  -- Client Connection Defaults / Shared Library Preloading
  category NOT ILIKE '%Client Connection Defaults%'
    AND
  -- Version and Platform Compatibility / Previous PostgreSQL Versions
  -- Version and Platform Compatibility / Other Platforms and Clients
  category NOT ILIKE '%Compatibility%'
    AND
  -- Connections and Authentication / Connection Settings
  category NOT ILIKE '% / Connection Settings%'
    AND
  -- Developer Options
  category NOT ILIKE '%Developer%'
    AND
  -- Error Handling
  category NOT ILIKE '%Error%'
    AND
  -- File Locations
  category NOT ILIKE '%File Locations%'
    AND
  -- Lock Management
  category NOT ILIKE '%Lock%'
    AND
  -- Reporting and Logging / What to Log
  -- broader '%Log%' pulls in WAL settings which we don't want here
  category NOT ILIKE '%Logging%'
    AND
  -- Resource Usage / Memory
  category NOT ILIKE '%Memory%'
    AND
  -- Preset Options
  category NOT ILIKE '%Preset Options%'
    AND
  -- Query Tuning / Planner Method Configuration
  -- Query Tuning / Planner Cost Constants
  -- Query Tuning / Other Planner Options
  -- Query Tuning / Genetic Query Optimizer
  -- Statistics / Query and Index Statistics Collector
  --
  -- more general to pull in 'track_activities' from category 'Statistics / Query and Index Statistics Collector'
  --category NOT ILIKE '%Query Tuning%'
  category NOT ILIKE '%Query%'
    AND
  -- Replication / Standby Servers
  -- Replication / Sending Servers
  -- Replication / Master Server
  -- Replication / Subscribers
  -- Replication
  category NOT ILIKE '%Replication%'
    AND
  -- Resource Usage / Memory
  -- Resource Usage / Asynchronous Behavior
  -- Resource Usage / Cost-Based Vacuum Delay
  -- Resource Usage / Background Writer
  -- Resource Usage / Disk
  -- Resource Usage / Kernel Resources
  category NOT ILIKE '%Resource%'
    AND
  name NOT ILIKE '%ssl%'
    AND
  -- Connections and Authentication / SSL
  category NOT ILIKE '%SSL%'
    AND
  short_desc NOT ILIKE '%SSL%'
    AND
  -- Statistics / Query and Index Statistics Collector
  -- Statistics / Monitoring
  category NOT ILIKE '%Statistics%'
    AND
  -- Write-Ahead Log / Settings
  -- Write-Ahead Log / Recovery Target
  -- Write-Ahead Log / Checkpoints
  -- Write-Ahead Log / Archive Recovery
  -- Write-Ahead Log / Archiving
  category NOT ILIKE '%Write-Ahead Log%'
;

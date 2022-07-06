#!/usr/bin/env bash

TIOJ_URL="${TIOJ_URL:-http://localhost}"
TIOJ_KEY="$(head -1 /run/secrets/judge-key)"
JUDGE_PARALLEL="${JUDGE_PARALLEL:-2}"
JUDGE_FETCH_INTERVAL="${JUDGE_FETCH_INTERVAL:-1}"
JUDGE_MAX_RSS_PER_TASK_MB="${JUDGE_MAX_RSS_PER_TASK_MB:-2048}"
JUDGE_MAX_OUTPUT_PER_TASK_MB="${JUDGE_MAX_OUTPUT_PER_TASK_MB:-1024}"
JUDGE_MAX_SUBMISSION_QUEUE_SIZE="${JUDGE_MAX_SUBMISSION_QUEUE_SIZE:-500}"

cat > /etc/tioj-judge.conf <<EOF
tioj_url = $TIOJ_URL
tioj_key = $TIOJ_KEY
parallel = $JUDGE_PARALLEL
fetch_interval = $JUDGE_FETCH_INTERVAL
max_rss_per_task_mb = $JUDGE_MAX_RSS_PER_TASK_MB
max_output_per_task_mb = $JUDGE_MAX_OUTPUT_PER_TASK_MB
max_submission_queue_size = $JUDGE_MAX_SUBMISSION_QUEUE_SIZE
EOF

exec tioj-judge

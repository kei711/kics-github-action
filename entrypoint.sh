#!/bin/ash

cd /kics-action
docker build -f Dockerfile.kics -t kics-action \
  --build-arg kics_docker_tag="$INPUT_KICS_DOCKER_TAG" .

# Since we are running Docker inside a Docker container in GitHub Actions,
# we need to specify the host machine folder path to the volume mount section.
REPOSITORY_NAME=$(echo $GITHUB_REPOSITORY | sed -e 's;[^/]*/;;g')
GITHUB_RUNNER_REPOSITORY_WORKSPACE="$RUNNER_WORKSPACE/$REPOSITORY_NAME"
docker run \
  -v "$GITHUB_RUNNER_REPOSITORY_WORKSPACE":"$GITHUB_WORKSPACE" \
  --env GITHUB_WORKSPACE \
  --env GITHUB_REPOSITORY \
  --env GITHUB_ACTION \
  --env GITHUB_ACTOR \
  --env GITHUB_API_URL \
  --env GITHUB_EVENT_NAME \
  --env GITHUB_EVENT_PATH \
  --env GITHUB_GRAPHQL_URL \
  --env GITHUB_JOB \
  --env GITHUB_REF \
  --env GITHUB_RUN_ID \
  --env GITHUB_RUN_NUMBER \
  --env GITHUB_SERVER_URL \
  --env GITHUB_SHA \
  --env GITHUB_WORKFLOW \
  --env INPUT_TOKEN \
  --env INPUT_ENABLE_COMMENTS \
  --env INPUT_PATH \
  --env INPUT_IGNORE_ON_EXIT \
  --env INPUT_FAIL_ON \
  --env INPUT_TIMEOUT \
  --env INPUT_PROFILING \
  --env INPUT_CONFIG_PATH \
  --env INPUT_PLATFORM_TYPE \
  --env INPUT_EXCLUDE_PATHS \
  --env INPUT_EXCLUDE_QUERIES \
  --env INPUT_EXCLUDE_CATEGORIES \
  --env INPUT_EXCLUDE_RESULTS \
  --env INPUT_OUTPUT_FORMATS \
  --env INPUT_OUTPUT_PATH \
  --env INPUT_PAYLOAD_PATH \
  --env INPUT_QUERIES \
  --env INPUT_SECRETS_REGEXES_PATH \
  --env INPUT_LIBRARIES_PATH \
  --env INPUT_DISABLE_FULL_DESCRIPTIONS \
  --env INPUT_DISABLE_SECRETS \
  --env INPUT_TYPE \
  --env INPUT_VERBOSE \
  --env INPUT_INCLUDE_QUERIES \
  --env INPUT_BOM \
  kics-action


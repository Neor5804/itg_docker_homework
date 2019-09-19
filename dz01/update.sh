#!/bin/bash
cd "$( dirname "${BASH_SOURCE[0]}" )"

DEFAULT_COMPOSE_FILE=$(ls *-compose.{yaml,yml})
COMPOSE_FILE=${DEFAULT_COMPOSE_FILE:-$1}

if [ -f .env ]; then
    source .env
fi

for image in $(grep '\s\+image:' $COMPOSE_FILE | sed 's/^\s*image://')
do
        eval image="${image}"
        docker pull $image
done

nohup /bin/bash -c "docker-compose -f $COMPOSE_FILE up -d --remove-orphans; echo \$? > /tmp/compose.code" 2>&1 > /tmp/docker-compose.out </dev/null &
PID=$!
while kill -0 $PID; do
    sleep 2s;
done
cat /tmp/docker-compose.out
COMPOSE_EXIT_CODE=$(cat /tmp/compose.code)
exit $COMPOSE_EXIT_CODE


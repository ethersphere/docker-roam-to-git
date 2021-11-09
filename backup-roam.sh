#!/usr/bin/env bash

CMD="roam-to-git --formats json markdown formatted edn --skip-push /tmp/roam-repo"

# run command once at beginning
$CMD

while true;
do
	SLEEP=$(( 3600 + ( $RANDOM % 900 + 1 ) ));
	echo "Sleeping $SLEEP seconds..."
	sleep $SLEEP
	$CMD
done


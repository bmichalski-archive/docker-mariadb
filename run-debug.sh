#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

$DIR/common-run.sh

docker run -p 3306:3306 --volumes-from mariadb-data --name mariadb -it bmichalski/mariadb /root/run-debug.sh

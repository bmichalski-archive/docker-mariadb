#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

bash $DIR/configure.sh

tail -f /var/log/mysql.*


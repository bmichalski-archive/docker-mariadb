#!/bin/bash

echo "`/sbin/ip route|awk '/default/ { print $3 }'` dockerhost" >> /etc/hosts

echo 'Acquire::Retries 0;
Acquire::http::Proxy-Auto-Detect "/root/detect-proxy.sh";' >> /etc/apt/apt.conf.d/01proxy


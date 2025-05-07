#!/usr/bin/env bash
lsof -i TCP:4444 | grep node | awk ' { print $2 } ' | xargs  kill -9

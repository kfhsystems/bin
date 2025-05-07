#!/bin/sh

SRC_DIR="/Users/khasanov/Projects/Eclipse/Java_TCP_UDP/src/"
DIST_DIR="khasanov@10.10.10.110:/home/khasanov/codes/java/net"

rsync -avz ${SRC_DIR} ${DIST_DIR}

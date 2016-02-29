#!/bin/sh·

exec 2>&1
set -e

# Starting the elasticsearch
exec   ~/elasticsearch-2.1.1/bin/elasticsearch


#!/bin/bash
# source: https://gist.github.com/epcim/e488af8be69b616eab3088a14a937e14

# Aggregate succeeded/failed/changes per node on a dry run.

salt \* state.apply --out=json --static test=true -b15 |  jq -r 'to_entries | map({ key:.key, value: { total: [.value[]]|length ,
  succeed: [select(.value>={})|.value[]|select(.result? == true )]|length,
  failed: [select(.value>={})|.value[]|select(.result? == false)]|length,
  null:   [select(.value>={})|.value[]|select(.result? == null)]|length,
  changes: [select(.value>={})|.value[]|select(.changes?|length > 0)]|length } }) | from_entries ' |\
  tee trend_$(date "+%Y-%m-%d-%s").json


# to review
ls trend*.json| sort |tail -n2 |xargs -n2 diff -y | colordiff

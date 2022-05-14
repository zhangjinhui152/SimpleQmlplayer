#!/bin/bash
path=content/image/controller
list=`ls`
for file in $list
do
  echo "${path}/${file}"
done

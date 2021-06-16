#!/bin/sh

#脚本所在目录
BASEDIR=$(dirname $0)
cd $BASEDIR
echo $BASEDIR

echo "请输入tag"
read -p "请输入tag: " tag_number
# version_number=${version_number:-''}
echo tag是: $tag_number

if [ ! $tag_number ]; then
  echo "未输入tag"
else
  git tag $tag_number
  git push origin $tag_number
  pod trunk push --allow-warnings --verbose
fi

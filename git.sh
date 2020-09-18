#!/bin/bash
# author:caiqiang
read -p "请输入提交信息" commitInfo
echo "提交中..."
git add .
git commit -m "$commitInfo"
git push
echo "提交完成"

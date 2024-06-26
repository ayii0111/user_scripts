#!/bin/zsh

# 確認是否有傳入參數
if [ $# -eq 0 ]; then
  echo "請提供套件名稱"
  exit 1
fi

# 套件名稱
PACKAGE_NAME=$1

# 使用 npm list 檢查套件是否已安裝
PACKAGE_INFO=$(npm list $PACKAGE_NAME 2>/dev/null | grep $PACKAGE_NAME)

# 判斷套件是否已安裝
if [ -z "$PACKAGE_INFO" ]; then
  echo "$PACKAGE_NAME 沒有安裝"
else
  # 從輸出中提取版本信息
  VERSION=$(echo $PACKAGE_INFO | grep -o '@[^ ]*' | tail -1)
  echo "$PACKAGE_NAME$VERSION"
fi


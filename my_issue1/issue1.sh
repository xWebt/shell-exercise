#!/usr/bin/env bash

user="tom"
password="tom"
LOGIN_SUCCESS_LOG="login.log"
LOGIN_FAILURE_LOG="loginerr.log"

# 函数：记录登录成功信息
log_success() {
  local terminal=$(tty)
  local timestamp=$(date "+%Y-%m-%d %H:%M:%S")
  echo "$timestamp - 成功登录来自：$terminal" >>"$LOGIN_SUCCESS_LOG"
}

log_failure() {
  local terminal=$(tty)
  local timestamp=$(date "+%Y-%m-%d %H:%M:%S")
  echo "$timestamp - 失败登录来自：$terminal" >>"$LOGIN_FAILURE_LOG"
}

show_last_failure() {
  if [ -s "$LOGIN_FAILURE_LOG" ]; then
    echo "上次失败登录记录："
    tail -n 1 "$LOGIN_FAILURE_LOG"
  fi
}

show_last_success() {
  if [ -s "$LOGIN_SUCCESS_LOG" ]; then
    echo "上次成功登录记录："
    tail -n 1 "$LOGIN_SUCCESS_LOG"
  fi
}

while true; do
  read -p "please enter your username: " name
  read -s -p "请输入密码: " words
  echo
  if [ "$name" = "$user" ] && [ "$words" = "$password" ]; then
    show_last_failure
    show_last_success
    echo "Welcome !"
    uname -r
    log_success
    break
  else
    echo "用户名或者密码错误"
    log_failure
  fi
done

echo "ending for all"

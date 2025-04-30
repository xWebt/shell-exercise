#!/usr/bin/env bash
JDK_VERSION="23.0.1"

# if test ! -f "version.txt"; then
#     touch "version.txt"
# fi

java -version 2>version.txt

JDK_NOW_VERSION=$(awk '/version/ {gsub(/"/, "", $3); print $3}' version.txt)
#echo $JDK_NOW_VERSION
if test $JDK_VERSION = $JDK_NOW_VERSION; then
    echo "have jdk and have correct version "
    exit 0
fi

echo "you JDK version is wrong or don't find JDK"
echo "开始配置JDK"
#以ubuntu/debian系统为例
install_JDK() {
    if command_exists apt-get; then
        sudo apt update
        if sudo apt install -y openjdk-23-jdk; then
            echo "JDK ${JDK_VERSION} 安装成功"
            return 0
        else
            echo "JDK ${JDK_VERSION} 安装失败"
            return 1
        fi
    else
        echo "不支持当前操作系统，请手动安装"
    fi
}

find_path() {

    if command_exists javac; then
        JDK_PATH=$(which java)
        if [[ -n "$JAVA_PATH" ]]; then
            JDK_HOME=$(dirname "$(dirname "$JAVA_PATH")")
            if [[ -d "$JDK_HOME" ]]; then
                echo "$JDK_HOME"
                return 0
            fi
        fi
    fi
    echo "无法自动找到 JDK 安装路径，请手动配置 JAVA_HOME"
    return 1
}
configure_environment() {
    echo "配置 JAVA_HOME 环境变量"
    jdk_path=$(find_path)
    if [[ $? -eq 0 ]]; then
        export JAVA_HOME="$jdk_path"
        export PATH="$JAVA_HOME/bin:$PATH"
        echo "已设置 JAVA_HOME=$JAVA_HOME"
        echo "已将 $JAVA_HOME/bin 添加到 PATH (当前会话)"

        . ~/.bashrc 2>/dev/null
        . ~/.zshrc 2>/dev/null
        . ~/.profile 2>/dev/null
        echo "环境变量已生效 (当前 shell 会话)"
        return 0
    else
        echo "无法自动配置 JAVA_HOME，请手动设置"
        return 1
    fi
}
if install_JDK; then
    if configure_environment; then
        echo "下载和安装完成"
        java -version
        exit 0
    else
        echo "下载完成但是环境配置失败"
    fi
else
    echo "安装失败，请检查错误信息"
    exit 1
fi

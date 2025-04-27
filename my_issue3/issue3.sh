#!/usr/bin/env bash

yanghui() {
    local n="$1"
    local k="$2"

    if ((k < 0 || k > n)); then
        echo 0
        return
    fi

    if ((k == 0 || k == n)); then
        echo 1
        return
    fi

    if ((k > n / 2)); then
        k="$((n - k))"
    fi

    result=1
    for ((i = 1; i <= k; i++)); do
        result=$((result * (n - i + 1) / i))
    done
    echo "$result"
}

while true; do
    read -p "请输入杨辉三角的行数：" number
    if [[ ! "$number" =~ ^[0-9]+$ ]]; then
        echo "请重新输入有效的正整数"
        continue
    fi

    for ((n = 0; n < number; n++)); do
        spaces=$(((number - n - 1) * 2))
        printf "%${spaces}s" ""

        for ((k = 0; k <= n; k++)); do
            now_number=$(yanghui "$n" "$k")
            printf "%-4d" "$now_number"
        done
        echo
    done
    echo "ending"
    break
done

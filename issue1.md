## 目标
写一个脚本，实现字符界面登录的模拟状态

## 要求
1. 提示用户输入用户名，然后提示输入口令
2. 内置用户tom，口令tom
3. 对用户输入的用户名和口令进行判断
4. 不正确的拒绝登录，返回等待用户输入
5. 失败的登录记录写入loginerr.log文件，记录日期时间和登录的终端设备
6. 正确的可以登录，显示欢迎信息后结束
7. 成功登录的记录写入login.log文件，记录日期时间和登录的终端设备
8. 登录成功时
    - 如果有上一次失败登录的记录，则显示记录信息。没有则不显示。
    - 如果有上一次登录成功的记录，则显示记录信息。没有则不显示。
    - 打印欢迎信息，提示当前内核版本号。
    - 清除上一次失败登录的记录。

![输入图片说明](https://images.gitee.com/uploads/images/2021/0529/222939_d6b591f4_7981918.png "login.gif")
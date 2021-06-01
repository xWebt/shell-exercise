## 目标

编写脚本，自动判断并处理指定版本的jdk的下载、安装和配置问题，以jdk 1.8为例子。


## 要求

1. 检查当前系统中是否有jdk 1.8
2. 安装jdk 1.8（如果没有的话）
3. 检查jdk版本是否是1.8
4. 修改环境变量并生效（不重启机器）

## 测试

编写一个java的HelloWorld.java程序，看看jdk是否正常工作了。

```java
public class HelloWorld {
    public static void main(String[] args){
        System.out.println("Hello World!");
    }
}
```

```bash
javac HelloWorld.java

java HelloWorld
```

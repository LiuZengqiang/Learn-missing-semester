Q:

1. 本课程需要使用类Unix shell，例如 Bash 或 ZSH。如果您在 Linux 或者 MacOS 上面完成本课程的练习，则不需要做任何特殊的操作。如果您使用的是 Windows，则您不应该使用 cmd 或是 Powershell；您可以使用Windows Subsystem for Linux或者是 Linux 虚拟机。使用```echo $SHELL```命令可以查看您的 shell 是否满足要求。如果打印结果为/bin/bash或/usr/bin/zsh则是可以的。  
2. 在 /tmp 下新建一个名为 missing 的文件夹。  
3. 用 man 查看程序 touch 的使用手册。  
4. 用 touch 在 missing 文件夹中新建一个叫 semester 的文件。
5. 将以下内容一行一行地写入 semester 文件：
    ```shell
    #!/bin/sh
    curl --head --silent https://missing.csail.mit.edu
    ```  
    第一行可能有点棘手， # 在Bash中表示注释，而 ! 即使被双引号（"）包裹也具有特殊的含义。 单引号（'）则不一样，此处利用这一点解决输入问题。更多信息请参考[Bash quoting手册](https://www.gnu.org/software/bash/manual/html_node/Quoting.html)。  
6. 尝试执行这个文件。例如，将该脚本的路径（./semester）输入到您的shell中并回车。如果程序无法执行，请使用 ls 命令来获取信息并理解其不能执行的原因。
7. 显式地指定脚本程序``sh``运行``./semester``，即``sh ./semester``。为什么这样可以成功运行，而``./semester``就运行失败？  
8. 查看 chmod 的手册(例如，使用 man chmod 命令)

9. 使用 chmod 命令改变权限，使 ./semester 能够成功执行，不要使用 sh semester 来执行该程序。您的 shell 是如何知晓这个文件需要使用 sh 来解析呢？更多信息请参考：[shebang](https://en.wikipedia.org/wiki/Shebang_(Unix))

10. 使用 | 和 > ，将 semester 文件输出的最后更改日期信息，写入主目录下的 last-modified.txt 的文件中

A:  

1.   
    ```shell
    echo $SHELL
    ```
2. 
    ```shell
    mkdir /tmp/missing
    ```
3.  
    ```shell
    man touch
    ```
4.  
    ```shell
    touch semester
    ```
5. 
    ```shell
    vi semester
    i
    #!/bin/sh
    curl --head --silent https://missing.csail.mit.edu
    :wq
    ```
6. 
    ```shell
    ./semester
    ```
    屏幕输出：
    ```shell
    -bash: ./semester: 权限不够
    ```  
    不能执行的原因：  
    semester文件没有可执行权限``x``。  

7. 
    因为``sh ./semester``命令为运行程序``sh``，并以``./semester``作为程序``sh``的参数，而``./semester``为直接将``semester``作为可执行的程序运行，此时``semester``没有可执行权限，无法被当做一个可执行程序运行，因此前者``sh ./semester``可以成勋运行，而后者``./semester``失败。  

8. 
    ```shell
    man chmod
    ```
9. 
    ```shell
    chmod +x ./semester
    ```
    ``shebang``也被称作``sharp-exclamation, sha-bang``等，``shebang``是指在 Linux 或 Unix 操作系统中用于标记脚本文件解释器的引导命令。``shebang``始于``#!``字符序列，在脚本文件的头部第一行出现，后面跟着要使用的解释器的路径。  
10. 
    ```shell
    ./semester | grep -i last-modified | cut -d':' -f2 | cut -c2- | tee > ~/last-modified.txt
    ```
    命令解释：  
    ``./semester`` 运行 curl ...  
    ``grep -i last-modified`` 找到 last-modified行  
    ``cut -d':' -f2`` 按照':'分割输入流并只输出第2个分割块  
    ``cut -c2-`` 将输入按照字符分割并只从第2个字符开始输出（去除输入流中的前缀' '）  
    ``tee > ~/last-modified.txt`` 将输入流写入文件last-modified.txt
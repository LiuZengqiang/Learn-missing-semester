1.  vimrc  
    vimrc  
2.  fizz-fuzz  
	所有代码都忽略了``:w``写入保存d命令  
    - 主函数没有被调用
    ```shell
    G   " 跳转到文件尾 "
    o   " 在下方插入一行并进入insert模式 "
    backspace " 删除前方空格 "
        " 输入下面代码 "
    if __name__ == '__main__':
        main()
    ```
    - 从0开始而不是从1开始
    ```shell
    /range<Ent>  " 查找 range "
    ww      " 往后跳转2个word "
    i       " 进入insert模式 "
    1,      " 输入该代码 "
    <Esc>   " 返回normal模式 "
    e       " 跳转到该单词后 "
    a       " 在该单词后添加内容 "
    +1      " 输入该代码 "
    <Esc>   " 返回normal模式 "
    ```
    - 在同一行打印结果
    ```shell
    /'fizz'<Ent> " 查找字符串 fizz "
    ee      " 往后跳转2个单词，到达单词尾 "
    i       " 进入insert模式 "
    ,end='' " 输入该代码 "
    jj.     " 下移2行，重复上次的操作，插入 ,end='' "
    ```
    - 是5的倍数应该输出'buzz'
    ```shell
    0       " 跳转行首 "
    ci'     " 修改第一个''内的内容 "
    buzz    " 修改为 buzz "
    ```
    - 使用运行参数控制limit
    ```shell
    gg      " 跳转到文件首 "
    O       " 在上方插入一行并进入insert模式 "
    import sys  " 输入该代码 "
    /10<Ent>    " 查找字符串10 "
    ci(         " 修改()内部的内容 "
    int(sys.argv[1])    " 修改为该代码 "
    ```

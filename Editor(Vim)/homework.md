Q:

1-7.略。  

8.（高阶）用 Vim 宏将 XML 转换到 JSON (例子文件)。 尝试着先完全自己做，但是在你卡住的时候可以查看上面宏 章节。  
新建三个宏``e``,``p``,``q``：  
``宏e``:用于将
```html
    <name>***</name>
```
转为
```json
"name":"***",
```

``宏p``:用于将
```html
<person>
    <name>***</name>
    <email>***</email>
</person>
```
转为：
```json
{
    "name":"***",
    "email":"***"
},
```
``宏q``：调用``宏p``并将光标下移一行；  
最后在```<person>```行执行```999@q```(执行999次``宏q``)；  

新建``宏e``：
```shell
Gdd     # 删除最后一行</people>
ggdd    # 删除第一行<people>
j       # 跳转到 <name>***</name 行>
qe^r"f>s":"<ESC>f<C"<ESC>q  # 新建宏e
3j      # 跳转到 第二个 <person> 处
qpS{<ESC>j@eA,<ESC>j@ejS},<ESC>q    # 新建宏p
j       # 跳转到第三个 <person> 处
qq@pjq  # 新建宏q
999@q   # 执行999次宏q
G$x     # 删除最后一行最后一个字符','
gg      # 跳转到第一行 
...     # 手动修改第一个 <person>***</person>部分
```
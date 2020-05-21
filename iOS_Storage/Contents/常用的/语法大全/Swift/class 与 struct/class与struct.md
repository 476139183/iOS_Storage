#  class与struct

1. class 可以继承，struct 不可以
2. class 是引用类型（Reference Type），struct 是值类型（Value Type） （引用传递可以多个对象指向同一块内存，值传递相对安全（相比于一个class的实例被多次引用更加安全））
3. struct 会根据属性自动生成对应的构造方法。
4. struct 结构较小，相对轻量，适用于复制操作
5. struct 无需担心 memory leak 或者多线程冲突问题（因为是值类型，在栈上，由系统管理）


---
---


Swift 的 Int、String、Array、Dict、Enum 都是值类型


---
---

疑问：

1. 值类型一定在栈上吗？
2. 引用类型的一个值类型属性是在栈还是堆上


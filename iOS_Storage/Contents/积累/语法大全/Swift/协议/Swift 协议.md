#  Swift 协议

自己理解：协议相当于对某一功能的接口进行规定。

协议规定了用来实现某一特定功能所必需的方法和属性。

任意能够满足协议要求的类型被称为遵循(conform)这个协议。

类，结构体或枚举类型都可以遵循协议，并提供具体实现来完成协议定义的方法和功能。


## 语法

协议的语法格式如下：

```
protocol SomeProtocol {
    // 协议内容
}
```

要使类遵循某个协议，需要在类型名称后加上协议名称，中间以冒号:分隔，作为类型定义的一部分。遵循多个协议时，各协议之间用逗号,分隔。

```
struct SomeStructure: FirstProtocol, AnotherProtocol {
    // 结构体内容
}
```

如果类在遵循协议的同时拥有父类，应该将父类名放在协议名之前，以逗号分隔。

```
class SomeClass: SomeSuperClass, FirstProtocol, AnotherProtocol {
    // 类的内容
}
```


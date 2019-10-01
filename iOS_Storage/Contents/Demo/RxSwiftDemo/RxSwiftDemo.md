#  RxSwiftDemo

RxSwift 是 ReactiveX 的 Swift 版本，全称 Reactive Extensions Swift，是一个响应式编程的基础框架。

响应式编程的基本思想是：你的程序可以**对底层数据的变化做出响应**，而不需要你直接告诉它。这样，你可以更专注于所需要处理的业务逻辑，而不需要去维护特定的状态。

**举个简单的例子：**
a ＝ b ＋ c 赋值之后 b 或者 c 的值变化后，a 的值不会跟着变化；响应式编程，目标就是，如果 b 或者 c 的数值发生变化，a 的数值会同时发生变化；

---

万物皆rx，rx是扩展的协议ReactiveCompatible一个属性：

```
extension ReactiveCompatible {

/// Reactive extensions.
public static var rx: RxSwift.Reactive<Self>.Type

/// Reactive extensions.
public var rx: RxSwift.Reactive<Self>
}
```

ReactiveCompatible协议：
```
/// A type that has reactive extensions.
public protocol ReactiveCompatible {
/// Extended type
associatedtype ReactiveBase

@available(*, deprecated, message: "Use `ReactiveBase` instead.")
typealias CompatibleType = ReactiveBase

/// Reactive extensions.
static var rx: Reactive<ReactiveBase>.Type { get set }

/// Reactive extensions.
var rx: Reactive<ReactiveBase> { get set }
}
```

NSObject是遵循了这个协议的：
```
/// Extend NSObject with `rx` proxy.
extension NSObject: ReactiveCompatible { }
```
**这就是万物皆rx的原因。**


---


可观察序列 - sequence

三部曲：
1. 创建序列
2.订阅信号
3.发送信号


---

disposeBag - 垃圾袋

每个Controller都有一个disposeBag，有没有什么更好的写法？

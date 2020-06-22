#  Swift 异常处理

苹果文档：
https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html#//apple_ref/doc/uid/TP40014097-CH42-ID508/

官方文档：
http://www.swift51.com/swift4.0/chapter2/18_Error_Handling.html

---


## Representing and Throwing Errors

In Swift, errors are represented by values of types that conform to the Error protocol. This empty protocol indicates that a type can be used for error handling.

```
enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}
```

the following code throws an error to indicate that five additional coins are needed by the vending machine:

```
throw VendingMachineError.insufficientFunds(coinsNeeded: 5)
```

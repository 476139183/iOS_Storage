#  getter 与 setter

在 `didSet` 里调用 setter 不会造成循环引用。

`items.append(1)` 和  `items.remove(at: 0)` 都会调用items的didSet方法。

didSet 是属性观察器。


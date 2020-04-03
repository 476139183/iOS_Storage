#  ASDisplayNode 的重要方法

## 1. `- init`

需要记住的最重要的一点是，init 方法必须能够在任何队列上调用。所以不要进行UI相关操作，如调用 `node.layer` `node.view.x` 等于 view 或 layer 有关的操作。



## 2. `- didLoad`

**在主线程调用。**
类似于 `UIViewController` 的 `-viewDidLoad` 方法。保证会在主线程上被调用，是执行任何 UIKit 代码合适的地方，例如添加手势识，更改 view 和 layer，初始化 UIKit 对象。



## 3. `- layoutSpecThatFits`

该方法定义了节点的布局，是你放置大部分布局代码的地方。重写此方法并不一定需要调用 super 方法。



## 4. `- layout`

在此方法中调用 super 将，会使用  `layoutSpec` 对象计算布局，所有子节点都将计算其 size 和 position。
`-layout` 在概念上类似于 `UIViewController` 的 `-viewwilllayoutsubview`，这是一个更改 hidden 属性、修改 view 属性、设置背景颜色的好地方。你可以在 `-layoutspec:` 方法中设定背景颜色，但这可能会存在时序问题。如果你需要使用原生的 UIView，可以在这里设置它们的 frame，不管怎样，你始终可以使用 `-initWithViewBlock:` 创建节点，并在其他地方的后台线程中进行调整。
这个方法在主线程上被调用，如果你使用的是 `ASLayoutSpec`，那么你不应该过多地依赖这个方法，因为在主线程上进行布局是非常可取的，需要这个方法的子类小于 1/10。
使用 -layout 的一个重要用途是你需要子节点的 size 是精确的。举例来说，当你希望一个 collectionNode 可以铺面屏幕，这种情况不被 ASLayoutSpec 很好的支持，此时最简单的做法是在这个方法中手动设定 frame：
subnode.frame = self.bounds复制代码如果你希望在 ASViewController 中得到相同的效果，那么你可以在 -viewWillLayoutSubviews 中做同样的事情，不过如果你的节点通过 initWithNode: 进行实例化，它会自动做到这一点。


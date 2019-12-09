#  ASViewController

## 1. `- init`

不要在这个方法中访问 self.view 或 self.node.view，因为这样会强制创建view。

ASViewController指定的构造器是`initWithNode:`，一个典型的构造器看起来就像下面的代码。

```
init() {
    super.init(node: ASDisplayNode())
}
```



## 2. `- loadView`

不要使用这个方法。



## 3. `- viewDidLoad`

这是访问 node.view 最早的方法，可以在这个方法中任意修改 view 和 layer 或添加手势。

**注：布局代码不要放在这里面！** 因为当界面重绘时，这里的代码不会被再次调用。UIViewController 中这个方法也是同样的，在这个方法中放置布局代码不是太好的做法，即使你的布局不会因为交互发生变化。



## 4. `- viewWillLayoutSubviews`

这个方法会与节点的 `-layout` 同时调用，当 `ASViewController` 的节点的边界发生改变，如旋转、分割屏幕、键盘弹出等行为，或者当视图的层次结构发生变化，如子节点添加、删除或改变大小时，这个方法将被调用。

因为它不经常被调用，但是调用就代表页面需要重绘，因此所有的布局代码最好都放在这个方法中，即使是不直接依赖于 size 的 UI 代码也应放在这里。



## 5. `-viewWillAppear: / -viewDidDisappear:`

尽管这些方法可能被多次调用，并且是可以执行布局代码的，但是这两个方法不会在所有需要重绘的时候被调用，因此除了特定的动画设置之外，不应该用于执行核心的布局代码。

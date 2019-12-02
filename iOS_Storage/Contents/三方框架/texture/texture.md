#  Texture

原名：AsyncDisplayKit，ASDK


================================


## 注意点












=================================



## 整体架构（包含三个部分）

1. Node（对UIView和CALayer的抽象）
2. Node Containers（node容器，负责加载渲染node）
3. Layout Engineer（node布局）



## Texture结点容器与UIKit

- ASCollectionNode  -  UICollectionView
- ASPagerNode  -  UIPageViewController
- ASTableNode  -  UITableView
- ASViewController  -  UIViewController
- ASNavigationController  -  UINavigationController
- ASTabBarController  -  UITabBarController



## Texture节点子类与UIKit

- ASDisplayNode  -  代替UIView，所有的node都继承自ASDisplayNode
- ASCellNode  -  代替UITableViewCell&UICollectionViewCell，需要和ASTableNode，ASCollectionNode和ASPagerNode共同使用。
- ASScrollNode  -  代替UIScrollView，这个节点对于创建自定义的，包含其他节点的可滚动区域非常有用。
- ASEditableTextNode  -  代替UITextView
- ASTextNode  -  代替UILabel
- ASImageNode  -  代替UIImage
- ASNetworkImageNode  -  代替UIImage
- ASMultiplexImageNode  -  代替UIImage
- ASVideoNode  -  代替AVPlayerLayer
- ASVideoPlayerNode  -  代替UIMoviePlayer
- ASControlNode  -  代替UIControl
- ASButtonNode  -  代替UIButton
- ASMapNode  -  代替MKMapView



## 为什么要使用Texture

- 布局计算、解码、绘制，异步并发执行
- Runloop任务分发（异步渲染）
- 声明式布局系统
- 图层预合成
- 深度优化列表性能（智能预加载）



## Nodes

`node`是 Texture 的基础，`ASDisplayNode` is an abstraction over UIView, which in turn is an abstraction over CALayer. 线程安全，可以在后台线程使用。

UIView的方法和属性Texture都有，如果UIView和CALayer都有的，默认使用UIView的，如`.clipsToBounds` vs `.masksToBounds`，但也有例外，如node使用position而不是center。

通过node也可以拿到view或layer：`node.view` or `node.layer`，确保在主线程操作！


## Node Containers

不要直接在view上添加node，否则可能会导致闪烁。Instead, you should add nodes as subnodes of one of the many node container classes. 

1. ASViewController
2. ASTableNode
3. ASCollectionNode
4. ASPagerNode


## Layout Engine

基于 CSS FlexBox model，it provides a declarative way of specifying a custom node’s size and layout of its subnodes.

A key advantage of using nodes over UIKit components is that all nodes perform layout and display off of the main thread, so that the main thread is available to immediately respond to user interaction events.



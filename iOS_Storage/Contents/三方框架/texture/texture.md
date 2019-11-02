#  texture

texture的特点：
1. 线程安全




## Nodes

`node`是 Texture 的基础，`ASDisplayNode` is an abstraction over UIView, which in turn is an abstraction over CALayer. 线程安全，可以在后台线程使用。

UIView的方法和属性Texture都有，如果UIView和CALayer都有的，默认使用UIView的，如`.clipsToBounds` vs `.masksToBounds`，但也有例外，如node使用position而不是center。

通过node也可以拿到view或layer：`node.view` or `node.layer`，确保在主线程操作！

1. ASDisplayNode
2. ASCellNode
3. ASButtonNode
4. ASTextNode
5. ASImageNode
6. ASNetworkImageNode
7. ASVideoNode
8. ASMapNode
9. ASControlNode
10. ASScrollNode
11. ASEditableTextNode
12. ASMultiplexImageNode

## Node Containers

不要直接在view上添加node，否则可能会导致闪烁。Instead, you should add nodes as subnodes of one of the many node container classes. 

1. ASViewController
2. ASTableNode
3. ASCollectionNode
4. ASPagerNode


## Layout Engine

基于 CSS FlexBox model，it provides a declarative way of specifying a custom node’s size and layout of its subnodes.

A key advantage of using nodes over UIKit components is that all nodes perform layout and display off of the main thread, so that the main thread is available to immediately respond to user interaction events.



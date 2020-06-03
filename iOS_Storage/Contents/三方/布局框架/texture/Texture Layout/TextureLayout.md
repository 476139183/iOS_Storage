# Texture 布局

## 两个概念：

1. 布局规则（Layout Specs）
2. 布局元素（Layout Elements）



## 一些 Node 需要设定 size

比如 ASTextNode，可以根据 .string 属性，确定自身的 size，其他具有固定大小的 Node 有：

- ASImageNode
- ASTextNode
- ASButtonNode

所有其他的 `Node` 在加载外部资源之前，或者没有固有大小，或者缺少一个固有大小。例如，在 URL 下载图像之前，`ASNetworkImageNode` 并不能确定它的大小，这些元素包括：

- ASVideoNode
- ASVideoPlayerNode
- ASNetworkImageNode
- ASEditableTextNode

缺少初始固有大小的这些 `Node` 必须使用 `ASRatioLayoutSpec（比例布局规则）`、`ASAbsoluteLayoutSpec(绝对布局规则)`或样式对象的`.size`属性为它们设置初始大小。



## 九大布局

1. ASWrapperLayoutSpec        填充布局
2. ASStackLayoutSpec             盒子布局
3. ASInsetLayoutSpec              插入布局
4. ASOverlayLayoutSpec          覆盖布局
5. ASBackgroundLayoutSpec   背景布局
6. ASCenterLayoutSpec            中心布局
7. ASRatioLayoutSpec              比例布局
8. ASRelativeLayoutSpec          顶点布局
9. ASAbsoluteLayoutSpec        绝对布局

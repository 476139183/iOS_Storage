#  标准CollectionView OC版


注：不同于UITableView，UICollectionView没有表头，表尾。

如果想给 `UICollectionView` 添加表头，可以通过修改 `UICollectionView` 的 `contentInset` 留出顶部空间，然后在 `UICollectionView` 上 add 你的表头。

添加表尾的思路一样。

如果是添加高度自适应的表头，可以监听表头高度变化，然后修改 `contentInset`。

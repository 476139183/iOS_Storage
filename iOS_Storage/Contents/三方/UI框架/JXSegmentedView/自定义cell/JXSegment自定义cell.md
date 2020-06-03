#  完全自定义

任何自定义需求，dataSource、cell、itemModel三个都要子类化。即使某个子类cell什么事情都不做。用于维护继承链，以免以后子类化都不知道要继承谁了；
dataSource和Cell自定义，请参考已实现的dataSource.

- dataSource需要继承JXSegmentedBaseDataSource
- cell需要继承JXSegmentedBaseCell（或者JXSegmentedTitleCell，JXSegmentedTitleImageCell）
- itemModel需要继承JXSegmentedBaseItemModel


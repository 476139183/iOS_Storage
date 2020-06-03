#  cache

## NSCache和NSDictionary区别

1. NSCache线程安全
2. 当系统资源将要耗尽时，它可以自动删减缓存，先行删减“最久未使用的”（lease recently used）对象。

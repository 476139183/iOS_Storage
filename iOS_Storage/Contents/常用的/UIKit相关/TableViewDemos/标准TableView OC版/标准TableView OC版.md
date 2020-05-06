#  标准TableView OC版

tableView的组头是否悬停由`UITableViewStyle`决定，下面的tableView组头没有悬停：
```
self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
```

---
简单实在的cell高度自适应内容：
https://www.jianshu.com/p/af4bc69839d8

---

表头、组头、cell都可以通过自动布局实现高度自适应内容

tableView的表头和表尾都是UIView:
表头表尾是不复用的
tableView.tableHeaderView = UIView()
tableView.tableFooterView = UIView()


组头和组尾是` UITableViewHeaderFooterView`
组头组尾是要复用的
他们有contentView
注意组头和组尾不要用相同的复用id，因为他们调用的是同一个方法`dequeueReusableHeaderFooterView`

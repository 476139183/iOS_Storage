#  Control Flow

注意只有 class 是引用传递，其他都是值传递。

```
struct StructModel {
    
    var name: String = ""
    
}

class ClassModel {
    
    var name: String = ""
    
}


guard var structModel = self.structModel else {
    return
}
guard var classModel = self.classModel else {
    return
}
structModel.name = "struct2"
classModel.name = "class2"

print(self.structModel?.name) // 打印class1
print(self.classModel?.name) // 打印class2

```

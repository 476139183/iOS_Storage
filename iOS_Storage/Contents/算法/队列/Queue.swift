
struct Queue<Element> {
    
    private var array: [Element] = []
    
    mutating func enqueue(_ item: Element) {
        array.append(item)
    }
    
    mutating func dequeue() {
        if array.count >= 1 {
            array.removeFirst()
        }
    }
    
    func enumerateFromHead(closure: (Element) -> ()) {
        array.forEach { (ele) in
            closure(ele)
        }
    }
    
    func enumerateFromTail(closure: (Element) -> ()) {
        array.reversed().forEach { (ele) in
            closure(ele)
        }
    }
    
}

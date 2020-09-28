//
//  ViewController.swift
//  LLLinkedList
//
//  Created by liushaohua02 on 2020/9/20.
//

import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        reverseList(ListNode(1))
    }
        
    /// 1、反转链表
    func reverseList(_ head: ListNode?) -> ListNode? {
        var pre: ListNode? = nil
        var current = head
        while current != nil {
            let next = current?.next
            current?.next = pre
            pre = current
            current = next
        }
        return pre
    }
    
    /* 删除链表的倒数第N个节点
     
     链表: 1->2->3->4->5  n = 2
     ==>1->2->3->5
     思路:
     1、使用快慢指针(fastNode、slowNode)
     2、fastNode先走n+1，走完之后slowNode开始与fastNode同步走
     3、当fastNode走到最后的时候，slowNode就是要删掉的节点的前一个节点
     4、让slowNode下一个节点等于slowNode的下下个节点==>slowNode?.next = slowNode?.next?.next
     5、返回head
     */
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head
        var fastNode: ListNode? = dummy
        var slowNode: ListNode? = dummy
        
        for _ in 1...n+1 {
            fastNode = fastNode?.next
        }
        
        while fastNode != nil {
            slowNode = slowNode?.next
            fastNode = fastNode?.next
        }
        slowNode?.next = slowNode?.next?.next
        
        return dummy.next
    }
    
    /*
     快慢指针的解法，
     */
    func hasCycle(_ head: ListNode?) -> Bool {
        guard let _ = head, let _ = head?.next else {
            return false
        }
        
        var fastNode = head?.next
        var slowNode = head
        
        while fastNode != nil {
            if slowNode === fastNode {
                return true
            }
            fastNode = fastNode?.next?.next;
            slowNode = slowNode?.next;
        }
        return false
    }
}


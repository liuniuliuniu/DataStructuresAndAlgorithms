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
     链表中环的检测
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
    
    /*
     是否是回文字符串， 双指针思想
     1、先将字符串按顺序放入数组中
     2、按照数组两边依次对比
     */
    func isPalindrome(_ s: String) -> Bool {
        
        var copy: [Character] = []
        for i in s.lowercased() {
            if i >= "0" && i <= "9" {
                copy.append(i)
            }
            else if i >= "a" && i <= "z" {
                copy.append(i)
            }
        }
        var i = 0, j = copy.count - 1
        while i <= j {
            if copy[i] != copy[j] { return false }
            i += 1
            j -= 1
        }
        return true
    }
    
    /// 合并两个有序链表 迭代法
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var queue: [ListNode?] = [] //队列，储存待维护的节点
        
        var pointer1: ListNode? = l1    //指针指向l1的头
        var pointer2: ListNode? = l2    //指针指向l2的头
                
        while pointer1 != nil || pointer2 != nil {  //同时遍历两个链表
            let val1: Int = pointer1?.val ?? Int.max
            let val2: Int = pointer2?.val ?? Int.max
            
            if val1 <= val2 {   //如果指针1所指向的节点值小于指针2所指向的节点值（或者节点2不存在），则将节点1加入到队列中，同时让队列中的最后一个节点指向节点1
                if let pre = queue.last { pre?.next = pointer1 }
                queue.append(pointer1)
                pointer1 = pointer1?.next
            } else {
                if let pre = queue.last { pre?.next = pointer2 }
                queue.append(pointer2)
                pointer2 = pointer2?.next
            }
        }
        return queue.first ?? nil   //队列队首即为新链表的表头
    }
    
    /*
     合并两个有序链表递归法
     如果 l1 或者 l2 一开始就是空链表
     ，那么没有任何操作需要合并，所以我们只需要返回非空链表。
     否则，我们要判断 l1 和 l2
哪一个链表的头节点的值更小，然后递归地决定下一个添加到结果里的节点。如果两个链表有一个为空，递归结束。
     */
    func mergeTwoListstwo(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1 else {
            return l2
        }
        
        guard let l2 = l2 else {
            return l1
        }
        
        if l1.val < l2.val {
            l1.next = mergeTwoLists(l1.next, l2)
            return l1
        } else {
            l2.next = mergeTwoLists(l1, l2.next)
            return l2
        }
    }
    
}


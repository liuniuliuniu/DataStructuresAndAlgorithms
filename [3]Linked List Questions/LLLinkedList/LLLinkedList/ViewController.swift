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
        // Do any additional setup after loading the view.
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

}


//
//  Solution.swift
//  LLArray
//
//  Created by liushaohua02 on 2020/7/12.
//  Copyright © 2020 liushaohua02. All rights reserved.
//

import UIKit

class Solution: NSObject {
    
    class func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
           // 存储 [nums[index]:index]. 空间复杂度 O(n)
           var numsDict: [Int: Int] = [:]
           // 遍历nums. 时间复杂度 O(n)
           for (index, num) in nums.enumerated() {
               // HashMap查找与当前num配对的元素. 时间复杂度 O(1)
               if let wantedIndex = numsDict[target - num] {
                   // 如果找到, 返回结果
                   return [wantedIndex, index]
               }
               // 如果没有找到, 将 num:index 加入HashMap
               numsDict[num] = index
           }
           return []
       }
}

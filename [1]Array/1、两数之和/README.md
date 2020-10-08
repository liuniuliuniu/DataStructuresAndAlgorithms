## 两数之和

### Question
给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。

你可以假设每种输入只会对应一个答案。但是，数组中同一个元素不能使用两遍。

### Example  

```
给定 nums = [2, 7, 11, 15], target = 9

因为 nums[0] + nums[1] = 2 + 7 = 9
所以返回 [0, 1]
```

### Solution

思路：
使用暴力破解法的话需时间复杂度O(n²)；
此处使用使用HashMap以空间换取时间, 时间复杂度降为O(n), 空间复杂度O(n)

```
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] { 
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


```

### from
[LeetCode - 1](https://leetcode-cn.com/problems/two-sum)
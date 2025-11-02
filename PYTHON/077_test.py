#Given an array of integers nums, return the length of the longest consecutive sequence of elements that can be formed from the array.
#A consecutive sequence consists of elements where each element is exactly 1 greater than the previous element. The elements in the sequence can be selected from any position in the array and do not need to appear in their original order.
#Example #1
#Input: nums = [100, 4, 200, 1, 3, 2]
#Output: 4
#Explanation: The longest consecutive is [1, 2, 3, 4] which have a length of 4
#Example #2
#Input: nums = [3, 2]
#Output: 2
#Explanation: The longest consecutive is [2, 3] which have a length of 2


def longest_consecutive(nums):
  nums.sort()
  s = set()
  print(nums)
  for i in range(len(nums)-1):
    print('print до IF',i, nums[i])
    if nums[i]+1 == nums[i+1]:
      s.add(nums[i])
      s.add(nums[i+1])
      print(f'i: {i}   num[i]: {nums[i]}  num[i+1]: {nums[i+1]}   s {s}')
  print(s)
  return len(s)
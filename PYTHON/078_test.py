#Дан массив целых чисел nums и целое число target. Вернуть индексы 2 чисел из массива nums, которые в сумме дают число target. 
#Если target можно получить несколькими способами, то в качестве результата вернуть только один.

class Answer:
    def twoSum(self, nums, target):
        s = []
        for i in range(len(nums)-1):
          for j in range(i+1, len(nums)):
            if nums[i]+nums[j] == target:
              s.append(i)
              s.append(j)
        return s
#Напишите функцию multiplier, которая будет возвращать произведение всех членов массива arr

class Answer:
    def multiplier(self, arr):
        s = 1 
        for i in range(len(arr)):
            s = s * arr[i]
        return s
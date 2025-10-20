#We're trying to create a digital clone of DJ Khaled. No fancy AI or alorithms needed.
#More specifically, you are given an integer array digits, where each digits[i] is the ith digit of positive whole number. It is ordered from most significant to least significant digit.
#Return an array of digits of the number after adding another one to the input.
#Example #1
#Input: digits = [1, 2, 3]
#Output: [1, 2, 4]
#Example #2
#Input: digits = [6, 9]
#Output: [7, 0]



def another_one(digits):
    s = list(str(int(''.join(map(str, digits))) + 1))
    h = list(map(int, s))
    return h
#Вам будет дана непустая строка. Ваша задача — вернуть средний символ (символы) строки.
#Если длина строки нечётная, верните средний символ.
#Если длина строки чётная, верните два средних символа.

def get_middle(s):
    length = len(s)
    if length % 2 == 0:
        middle1 = s[length // 2 - 1]
        middle2 = s[length // 2]
        return middle1 + middle2
    else:
        return s[length // 2]